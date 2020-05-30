package com.mvc.prectice.chat.dto;

import java.util.Date;

public class ChatListDto {
	private int chatlist_no;
	private int chatroom_no;
	private int member_no;
	private Date chatlist_intime;
	private Date chatlist_outtime;
	private int chatlist_read;
	public ChatListDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatListDto(int chatlist_no, int chatroom_no, int member_no, Date chatlist_intime, Date chatlist_outtime,
			int chatlist_read) {
		super();
		this.chatlist_no = chatlist_no;
		this.chatroom_no = chatroom_no;
		this.member_no = member_no;
		this.chatlist_intime = chatlist_intime;
		this.chatlist_outtime = chatlist_outtime;
		this.chatlist_read = chatlist_read;
	}
	public int getChatlist_no() {
		return chatlist_no;
	}
	public void setChatlist_no(int chatlist_no) {
		this.chatlist_no = chatlist_no;
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
	public Date getChatlist_intime() {
		return chatlist_intime;
	}
	public void setChatlist_intime(Date chatlist_intime) {
		this.chatlist_intime = chatlist_intime;
	}
	public Date getChatlist_outtime() {
		return chatlist_outtime;
	}
	public void setChatlist_outtime(Date chatlist_outtime) {
		this.chatlist_outtime = chatlist_outtime;
	}
	public int getChatlist_read() {
		return chatlist_read;
	}
	public void setChatlist_read(int chatlist_read) {
		this.chatlist_read = chatlist_read;
	}
	
	

}
