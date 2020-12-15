package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	@Column(unique = true)
	private String categoryTital;
	private String categoryDescription;
	@OneToMany(mappedBy ="category")
	private List<Product> products = new ArrayList<Product>();

	public Category(String categoryTital, String categoryDescription,List<Product> products) {
		super();
		this.categoryTital = categoryTital;
		this.categoryDescription = categoryDescription;
		this.products=products;
	}
	
	

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTital() {
		return categoryTital;
	}

	public void setCategoryTital(String categoryTital) {
		this.categoryTital = categoryTital;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	
	

	public List<Product> getProducts() {
		return products;
	}



	public void setProducts(List<Product> products) {
		this.products = products;
	}

    

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}



	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTital=" + categoryTital + ", categoryDescription="
				+ categoryDescription + "]";
	}

}
