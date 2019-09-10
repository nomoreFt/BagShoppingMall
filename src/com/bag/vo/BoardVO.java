package com.bag.vo;

import java.util.Date;

public class BoardVO {
	
	private int bNum;
	private String bTitle;
	private String bContents;
	private int bHit_cnt;
	private String bDate;
	private String bId;
	
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int bNum, String bTitle, String bContents, int bHit_cnt, String bDate, String bId) {
		super();
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bContents = bContents;
		this.bHit_cnt = bHit_cnt;
		this.bDate = bDate;
		this.bId = bId;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContents() {
		return bContents;
	}

	public void setbContents(String bContents) {
		this.bContents = bContents;
	}

	public int getbHit_cnt() {
		return bHit_cnt;
	}

	public void setbHit_cnt(int bHit_cnt) {
		this.bHit_cnt = bHit_cnt;
	}

	public String getbDate() {
		return bDate;
	}

	public void setbDate(String bDate) {
		this.bDate = bDate;
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}
}
