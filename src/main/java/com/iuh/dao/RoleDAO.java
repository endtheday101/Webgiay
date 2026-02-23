package com.iuh.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iuh.entity.Role;

public interface RoleDAO extends JpaRepository<Role, String> {
}
