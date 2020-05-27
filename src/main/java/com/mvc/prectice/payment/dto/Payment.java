package com.mvc.prectice.payment.dto;

// 4
public class Payment {
	private int paymentNo;
	private String memberName;
	private String paymentUID;
	private int paymentAmount;
	

	
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public int getPaymentNo() {
		return paymentNo;
		
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPaymentUID() {
		return paymentUID;
	}

	public void setPaymentUID(String paymentUID) {
		this.paymentUID = paymentUID;
	}
	public Payment(int paymentNo, String memberName, String paymentUID, int paymentAmount) {
		super();
		this.paymentNo = paymentNo;
		this.memberName = memberName;
		this.paymentUID = paymentUID;
		this.paymentAmount = paymentAmount;
	}
	public Payment() {
		// TODO Auto-generated constructor stub
	}
}
