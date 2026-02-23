package com.iuh.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iuh.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String> {
	Account findByUsername(String username);
	Account findByUsernameIgnoreCase(String username);
	Optional<Account> findByEmail(String email);
	@Query("SELECT a FROM Account a WHERE a.email LIKE ?1")
	Account getAccountByEmail(String email);
	public boolean existsByusername(String username);
}
