package com.bag.vo;

public class MembersVO {
	
	private String id;
	private String pw;
	private String name;
	private int tel;
	private String addr;
	private String accname;
	private String accbank;
	private String accnum;
	
	
	public MembersVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MembersVO(String id, String pw, String name, int tel, String addr, String accname, String accbank,
			String accnum) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.accname = accname;
		this.accbank = accbank;
		this.accnum = accnum;
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getTel() {
		return tel;
	}


	public void setTel(int tel) {
		this.tel = tel;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getAccname() {
		return accname;
	}


	public void setAccname(String accname) {
		this.accname = accname;
	}


	public String getAccbank() {
		return accbank;
	}


	public void setAccbank(String accbank) {
		this.accbank = accbank;
	}


	public String getAccnum() {
		return accnum;
	}


	public void setAccnum(String accnum) {
		this.accnum = accnum;
	}
	
	
	
}
