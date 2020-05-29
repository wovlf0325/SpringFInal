package com.mvc.prectice.chat.dto;

import java.util.Date;

public class MassageDto {
	private int massage_no;
	private int chatroom_no;
	private int member_no;
	private String massage_content;
	private Date massage_regtime;
	public MassageDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MassageDto(int massage_no, int chatroom_no, int member_no, String massage_content, Date massage_regtime) {
		super();
		this.massage_no = massage_no;
		this.chatroom_no = chatroom_no;
		this.member_no = member_no;
		this.massage_content = massage_content;
		this.massage_regtime = massage_regtime;
	}
	public int getMassage_no() {
		return massage_no;
	}
	public void setMassage_no(int massage_no) {
		this.massage_no = massage_no;
	}
	public int getChatroom_no() {
		return chatroom_no;
	}
	public void setChatroom_no(int chatroom_no) {
		this.chatroom_no = chatroom_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMassage_content() {
		return massage_content;
	}
	public void setMassage_content(String massage_content) {
		this.massage_content = massage_content;
	}
	public Date getMassage_regtime() {
		return massage_regtime;
	}
	public void setMassage_regtime(Date massage_regtime) {
		this.massage_regtime = massage_regtime;
	}
	
	

}
