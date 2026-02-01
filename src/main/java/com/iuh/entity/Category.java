package com.iuh.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable {
	@Id
	private String id;
	private String name;
	private Boolean available;

	@JsonIgnore
	@OneToMany(mappedBy = "category")
	private List<Product> products;

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + "]";
	}
}
