package com.iuh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iuh.dao.CategoryDAO;
import com.iuh.dao.ProductDAO;
import com.iuh.entity.Category;
import com.iuh.entity.Product;

@Controller
public class LoadPage {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@RequestMapping({ "/", "index.html" })
	public String index(Model model) {
		// Lấy danh sách sản phẩm
		List<Product> products = productDAO.findAll();
		model.addAttribute("products", products);

		// Lấy danh sách category
		List<Category> categories = categoryDAO.findAll();
		model.addAttribute("categories", categories);

		// Đếm sản phẩm theo category (cho navigation)
		List<Object[]> results = productDAO.countProductsByCategory();
		model.addAttribute("results", results);

		return "index";
	}
}
