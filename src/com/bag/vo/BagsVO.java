package com.bag.vo;

public class BagsVO {
	String num;
	String bag_src;
	String bag_name;
	String bag_price;
	String bag_link;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getBag_src() {
		return bag_src;
	}
	public void setBag_src(String bag_src) {
		this.bag_src = bag_src;
	}
	public String getBag_name() {
		return bag_name;
	}
	public void setBag_name(String bag_name) {
		this.bag_name = bag_name;
	}
	public String getBag_price() {
		return bag_price;
	}
	public void setBag_price(String bag_price) {
		this.bag_price = bag_price;
	}
	public String getBag_link() {
		return bag_link;
	}
	public void setBag_link(String bag_link) {
		this.bag_link = bag_link;
	}
	public BagsVO(String bag_src, String bag_name, String bag_price, String bag_link) {
		super();
		this.bag_src = bag_src;
		this.bag_name = bag_name;
		this.bag_price = bag_price;
		this.bag_link = bag_link;
	}
	public BagsVO() {
	}
	@Override
	public String toString() {
		return "BagsVO [bag_src=" + bag_src + ", bag_name=" + bag_name + ", bag_price=" + bag_price + ", bag_link="
				+ bag_link + "]";
	}
	
	
}
