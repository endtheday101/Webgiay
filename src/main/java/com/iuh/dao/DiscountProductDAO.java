package com.iuh.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iuh.entity.DiscountProduct;
import com.iuh.entity.Product;

public interface DiscountProductDAO extends JpaRepository<DiscountProduct, Integer> {
	List<DiscountProduct> findByProduct(Product product);

	@Query("SELECT p FROM DiscountProduct p where p.product.id = ?1")
	List<DiscountProduct> findByIdProduct(Integer productId);
}
