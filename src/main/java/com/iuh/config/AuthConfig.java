package com.iuh.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.iuh.service.UserService;

@Configuration
@EnableWebSecurity
public class AuthConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public BCryptPasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Autowired
	UserService userService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();

		http.authorizeRequests()
				.antMatchers("/assets/**").hasAnyRole("STAF", "DIRE")
				.anyRequest().permitAll();

		// Form login
		http.formLogin().loginPage("/login")
				.loginProcessingUrl("/login/success")
				.defaultSuccessUrl("/index.html", false)
				.failureUrl("/login/error")
				.usernameParameter("username").passwordParameter("password");

		http.rememberMe().rememberMeParameter("remember");

		// Logout
		http.logout().logoutUrl("/logout").logoutSuccessUrl("/logout/success");

		// OAuth2 login
		http.oauth2Login()
				.loginPage("/login")
				.defaultSuccessUrl("/oauth2/login/success", true)
				.failureUrl("/login/error")
				.authorizationEndpoint()
				.baseUri("/oauth2/authorization");
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers(HttpMethod.OPTIONS, "/**");
	}
}
