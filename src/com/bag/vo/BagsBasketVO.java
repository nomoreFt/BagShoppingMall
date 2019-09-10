package com.bag.vo;

public class BagsBasketVO {
int selectedNum;
String selectedBag;

public int getSelectedNum() {
	return selectedNum;
}
public void setSelectedNum(int selectedNum) {
	this.selectedNum = selectedNum;
}
public String getSelectedBag() {
	return selectedBag;
}
public void setSelectedBag(String selectedBag) {
	this.selectedBag = selectedBag;
}
public BagsBasketVO(int selectedNum, String selectedBag) {
	super();
	this.selectedNum = selectedNum;
	this.selectedBag = selectedBag;
}
public BagsBasketVO() {
	super();
}



}
