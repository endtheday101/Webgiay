package com.iuh.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iuh.entity.Size;

public interface SizeDAO extends JpaRepository<Size, Integer> {

	@Query("Select o From Size o where o.product.id = ?1")
	List<Size> findByIdProduct(Integer productId);

	@Query("SELECT s.quantity FROM Size s WHERE s.product.id = ?1 AND s.sizes = ?2")
	Integer findQuantityByProductIdAndSize(Integer productId, Integer size);
}
