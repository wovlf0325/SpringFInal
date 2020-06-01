package com.mvc.prectice.payment.dto;

// 4
public class Payment {
	private int paymentNo;
	private String member_email;
	private String member_name;
	private int house_id;
	private String paymentUID;
	private int paymentAmount;
	
	public Payment() {
		
	}
	
	public Payment(int paymentNo, String member_email, String member_name, int house_id, String paymentUID,
			int paymentAmount) {
		this.paymentNo = paymentNo;
		this.member_email = member_email;
		this.member_name = member_name;
		this.house_id = house_id;
		this.paymentUID = paymentUID;
		this.paymentAmount = paymentAmount;
	}
	
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getHouse_id() {
		return house_id;
	}
	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}
	public String getPaymentUID() {
		return paymentUID;
	}
	public void setPaymentUID(String paymentUID) {
		this.paymentUID = paymentUID;
	}
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	
	

	
}
