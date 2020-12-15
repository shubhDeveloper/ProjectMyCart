package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pName;
	@Column(length = 3000)
	private String pDisc;
	private String pPic;
	private int pPrice;
	private int pDiscount;
	private int pQuentity;
	@ManyToOne
	private Category category;

	public Product(String pName, String pDisc, String pPic, int pPrice, int pDiscount, int pQuentity,Category category) {
		super();
		this.pName = pName;
		this.pDisc = pDisc;
		this.pPic = pPic;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuentity = pQuentity;
		this.category = category;
	}

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpDisc() {
		return pDisc;
	}

	public void setpDisc(String pDisc) {
		this.pDisc = pDisc;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}

	public int getpQuentity() {
		return pQuentity;
	}

	public void setpQuentity(int pQuentity) {
		this.pQuentity = pQuentity;
	}
	
	

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pDisc=" + pDisc + ", pPic=" + pPic + ", pPrice=" + pPrice
				+ ", pDiscount=" + pDiscount + ", pQuentity=" + pQuentity + "]";
	}

	public int getPriceAfterDiscount()
    {
   	 int d=(int)((this.getpDiscount()/100.0)*this.getpPrice());
   	 return this.getpPrice()-d;
    }
	
	
}
