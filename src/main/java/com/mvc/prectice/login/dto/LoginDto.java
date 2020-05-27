package com.mvc.prectice.login.dto;

public class LoginDto {

	private int member_no;
	private int house_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_address;
	private String member_addone;
	private String member_detailadd;
	private String member_profileimg;
	private String member_role;
	private String member_area;
	private String member_interest;
	private String member_rating;
	private String member_delflag;
	private String member_status;
	


	public LoginDto(int member_no, int house_no, String member_id, String member_pw, String member_name,
			String member_phone, String member_email, String member_address, String member_addone,
			String member_detailadd, String member_profileimg, String member_role, String member_area,
			String member_interest, String member_rating, String member_delflag, String member_status) {
		super();
		this.member_no = member_no;
		this.house_no = house_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_address = member_address;
		this.member_addone = member_addone;
		this.member_detailadd = member_detailadd;
		this.member_profileimg = member_profileimg;
		this.member_role = member_role;
		this.member_area = member_area;
		this.member_interest = member_interest;
		this.member_rating = member_rating;
		this.member_delflag = member_delflag;
		this.member_status = member_status;
	}


	public LoginDto() {
		// TODO Auto-generated constructor stub

	}

	public LoginDto(String member_id, String member_pw, String member_name, String member_phone, String member_email,
			String member_address, String member_role, String member_area, String member_interest,
			String member_status) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_address = member_address;
		this.member_role = member_role;
		this.member_area = member_area;
		this.member_interest = member_interest;
		this.member_status = member_status;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getHouse_no() {
		return house_no;
	}

	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_addone() {
		return member_addone;
	}

	public void setMember_addone(String member_addone) {
		this.member_addone = member_addone;
	}

	public String getMember_detailadd() {
		return member_detailadd;
	}

	public void setMember_detailadd(String member_detailadd) {
		this.member_detailadd = member_detailadd;
	}

	public String getMember_profileimg() {
		return member_profileimg;
	}

	public void setMember_profileimg(String member_profileimg) {
		this.member_profileimg = member_profileimg;
	}

	public String getMember_role() {
		return member_role;
	}

	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}

	public String getMember_area() {
		return member_area;
	}

	public void setMember_area(String member_area) {
		this.member_area = member_area;
	}

	public String getMember_interest() {
		return member_interest;
	}

	public void setMember_interest(String member_interest) {
		this.member_interest = member_interest;
	}

	public String getMember_rating() {
		return member_rating;
	}

	public void setMember_rating(String member_rating) {
		this.member_rating = member_rating;
	}

	public String getMember_delflag() {
		return member_delflag;
	}


	public void setMember_delflag(String member_delflag) {
		this.member_delflag = member_delflag;
	}

	public String getMember_status() {
		return member_status;
	}

	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	
	public String getId() {
		return member_id;
	}
	
	public void setId(String id) {
		this.member_id = id;
	}
	
	
	
}
