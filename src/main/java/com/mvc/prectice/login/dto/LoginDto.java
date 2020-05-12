package com.mvc.prectice.login.dto;

public class LoginDto {

	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String addone;
	private String detailadd;
	private String profileimg;
	private String area;
	private String interest;
	private String role;
	private String status;
	
	
	public LoginDto() {
	
	}
	public LoginDto(String id, String pw, String name, String phone, String email, String address, String addone,
			String detailadd, String profileimg) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.addone = addone;
		this.detailadd = detailadd;
		this.profileimg = profileimg;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddone() {
		return addone;
	}
	public void setAddone(String addone) {
		this.addone = addone;
	}
	public String getDetailadd() {
		return detailadd;
	}
	public void setDetailadd(String detailadd) {
		this.detailadd = detailadd;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LoginDto(String id, String pw, String name, String phone, String email, String address, String addone,
			String detailadd, String profileimg, String area, String interest, String role, String status) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.addone = addone;
		this.detailadd = detailadd;
		this.profileimg = profileimg;
		this.area = area;
		this.interest = interest;
		this.role = role;
		this.status = status;
	}
	
}
