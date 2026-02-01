package com.iuh.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iuh.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {

	@Query("SELECT c.name, COALESCE(COUNT(p), 0), c.available FROM Category c LEFT JOIN Product p ON c.id = p.category.id AND p.available = true GROUP BY c.name, c.available")
	List<Object[]> countProductsByCategory();

	@Query("SELECT p FROM Product p WHERE p.available = true")
	List<Product> findAllAvailable();
}
