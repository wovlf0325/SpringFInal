package com.mvc.prectice.chat.dto;

public class ChatRoomDto {
	private int chatroom_no;
	private int house_no;
	private String chatroom_title;
	private int chatroom_totalcount;
	private int chatroom_nowcount;
	public ChatRoomDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getChatroom_title() {
		return chatroom_title;
	}

	public void setChatroom_title(String chatroom_title) {
		this.chatroom_title = chatroom_title;
	}

	public ChatRoomDto(int chatroom_no, int house_no, String chatroom_title, int chatroom_totalcount,
			int chatroom_nowcount) {
		super();
		this.chatroom_no = chatroom_no;
		this.house_no = house_no;
		this.chatroom_title = chatroom_title;
		this.chatroom_totalcount = chatroom_totalcount;
		this.chatroom_nowcount = chatroom_nowcount;
	}

	public int getChatroom_no() {
		return chatroom_no;
	}
	public void setChatroom_no(int chatroom_no) {
		this.chatroom_no = chatroom_no;
	}
	public int getHouse_no() {
		return house_no;
	}
	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}
	public int getChatroom_totalcount() {
		return chatroom_totalcount;
	}
	public void setChatroom_totalcount(int chatroom_totalcount) {
		this.chatroom_totalcount = chatroom_totalcount;
	}
	public int getChatroom_nowcount() {
		return chatroom_nowcount;
	}
	public void setChatroom_nowcount(int chatroom_nowcount) {
		this.chatroom_nowcount = chatroom_nowcount;
	}
	
	
	

}
