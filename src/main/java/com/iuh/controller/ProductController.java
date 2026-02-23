package com.iuh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iuh.dao.DiscountProductDAO;
import com.iuh.dao.ImageDAO;
import com.iuh.dao.ProductDAO;
import com.iuh.dao.SizeDAO;
import com.iuh.entity.DiscountProduct;
import com.iuh.entity.Product;
import com.iuh.entity.Size;

@Controller
public class ProductController {

	@Autowired
	ProductDAO dao;
	@Autowired
	SizeDAO sizeDAO;
	@Autowired
	DiscountProductDAO dpDAO;
	@Autowired
	ImageDAO imageDAO;

	@RequestMapping("/shop-single.html/{productId}/{slug}")
	public String getProduct(Model model, @PathVariable("productId") int productId,
			@PathVariable("slug") String slug) {
		Product product = dao.findById(productId).get();
		List<Size> listS = sizeDAO.findByIdProduct(productId);
		List<DiscountProduct> discountProducts = dpDAO.findByIdProduct(productId);

		model.addAttribute("prod", product);
		model.addAttribute("prodd", listS);
		model.addAttribute("discountProducts", discountProducts);

		// Đếm sản phẩm theo category (cho navigation)
		List<Object[]> results = dao.countProductsByCategory();
		model.addAttribute("results", results);

		return "shop-single";
	}
}
