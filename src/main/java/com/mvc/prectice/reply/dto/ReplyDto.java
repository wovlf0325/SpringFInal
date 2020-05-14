package com.mvc.prectice.reply.dto;

import java.util.Date;

public class ReplyDto {
	private int reply_no;
	private int board_no;
	private String member_id;
	private String reply_content;
	private Date reply_regdate;
	
	
	public ReplyDto() {
		super();
	}

	public ReplyDto(int reply_no, int board_no, String member_id, String reply_content, Date reply_regdate) {
		super();
		this.reply_no = reply_no;
		this.board_no = board_no;
		this.member_id = member_id;
		this.reply_content = reply_content;
		this.reply_regdate = reply_regdate;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_regdate() {
		return reply_regdate;
	}

	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}

	@Override
	public String toString() {
		return "ReplyDto [reply_no=" + reply_no + ", board_no=" + board_no + ", member_id=" + member_id
				+ ", reply_content=" + reply_content + ", reply_regdate=" + reply_regdate + "]";
	}
	
	

}
