package com.mvc.prectice.board.dto;

import java.util.Date;

public class BoardDto {

	private int board_no;
	private String board_writer;
	private String board_title;
	private String board_content;
	private Date board_regdate;
	private int board_views;
	private int board_like;
	private int board_kind;
	private int recnt;
	
	//검색
	private String searchType;
	private String keyword;
	
	public BoardDto() {
	
	}

	


	public BoardDto(int board_no, String board_writer, String board_title, String board_content, Date board_regdate,
			int board_views, int board_like, int board_kind, int recnt, String searchType, String keyword) {
		super();
		this.board_no = board_no;
		this.board_writer = board_writer;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_regdate = board_regdate;
		this.board_views = board_views;
		this.board_like = board_like;
		this.board_kind = board_kind;
		this.recnt = recnt;
		this.searchType = searchType;
		this.keyword = keyword;
	}




	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public int getBoard_views() {
		return board_views;
	}
	public void setBoard_views(int board_views) {
		this.board_views = board_views;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public int getBoard_kind() {
		return board_kind;
	}
	public void setBoard_kind(int board_kind) {
		this.board_kind = board_kind;
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getRecnt() {
		return recnt;
	}

	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}

	
}
