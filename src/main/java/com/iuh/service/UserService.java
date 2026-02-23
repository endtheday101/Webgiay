package com.iuh.service;

import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Service;

import com.iuh.dao.AccountDAO;
import com.iuh.dao.AuthorityDAO;
import com.iuh.dao.RoleDAO;
import com.iuh.entity.Account;
import com.iuh.entity.Authority;
import com.iuh.entity.MailInfo;
import com.iuh.entity.Role;

import java.util.Optional;

@Service
public class UserService implements UserDetailsService {

	@Autowired
	AccountDAO accDAO;

	@Autowired
	BCryptPasswordEncoder pe;

	@Autowired
	AccountDAO accountDAO;
	@Autowired
	AuthorityDAO authorityDAO;
	@Autowired
	RoleDAO roleDAO;
	@Autowired
	MailerService mailerService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {
			Account account = accDAO.findByUsername(username);

			if (account != null && account.getAvailable() == true) {
				String password = account.getPassword();
				String[] roles = account.getAuthorities().stream()
						.map(au -> au.getRole().getId())
						.collect(Collectors.toList()).toArray(new String[0]);

				return User.withUsername(username)
						.password(pe.encode(password))
						.roles(roles).build();
			} else {
				throw new LockedException(username);
			}

		} catch (Exception e) {
			throw new UsernameNotFoundException(username + " not found");
		}
	}

	public void loginFromOAuth2(OAuth2AuthenticationToken oauth2) {
		String name = oauth2.getPrincipal().getAttribute("name");
		String email = oauth2.getPrincipal().getAttribute("email");
		String password = Long.toHexString(System.currentTimeMillis());

		Optional<Account> existingAccount = accountDAO.findById(email);
		if (existingAccount.isPresent()) {
			UserDetails userDetails = User.withUsername(email)
					.password(existingAccount.get().getPassword()).roles("GUEST").build();
			Authentication auth = new UsernamePasswordAuthenticationToken(userDetails, null,
					userDetails.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(auth);
		} else {
			Account account = new Account();
			account.setUsername(email);
			account.setFullname(name);
			account.setPassword(password);
			account.setEmail(email);
			account.setPhoto("nv01.jpg");
			account.setAvailable(true);
			accountDAO.save(account);

			Authority authority = new Authority();
			authority.setAccount(account);
			Role role = roleDAO.findById("CUST").orElse(null);
			authority.setRole(role);
			authorityDAO.save(authority);

			MailInfo mail = new MailInfo();
			mail.setTo(email);
			mail.setSubject("Chào mừng đăng kí tài khoản tại web Shoe Galaxy thành công");
			StringBuilder bodyBuilder = new StringBuilder();
			bodyBuilder.append("Đây là mật khẩu của bạn ").append(password)
					.append(" . Bạn có đổi mật khẩu tại phần thông tin cá nhân");
			mail.setBody(bodyBuilder.toString());
			mailerService.queue(mail);

			UserDetails userDetails = User.withUsername(email).password(pe.encode(password)).roles("GUEST").build();
			Authentication auth = new UsernamePasswordAuthenticationToken(userDetails, password,
					userDetails.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(auth);
		}
	}
}
