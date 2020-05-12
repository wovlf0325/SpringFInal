package com.mvc.prectice.letter.dto;

import java.util.Date;

public class LetterDto {

	private int letter_no;
	private String letter_to;    //받는사람(FK)
	private String letter_from;  //보내는사람
	private String letter_title;
	private String letter_content;
	private Date letter_regdate;
	private String letter_read;    // 읽음여부: 안읽음(N), 읽음(Y)
	
	public LetterDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LetterDto(int letter_no, String letter_to, String letter_from, String letter_title, String letter_content,
			Date letter_regdate, String letter_read) {
		super();
		this.letter_no = letter_no;
		this.letter_to = letter_to;
		this.letter_from = letter_from;
		this.letter_title = letter_title;
		this.letter_content = letter_content;
		this.letter_regdate = letter_regdate;
		this.letter_read = letter_read;
	}

	public int getLetter_no() {
		return letter_no;
	}

	public void setLetter_seq(int letter_no) {
		this.letter_no = letter_no;
	}

	public String getLetter_to() {
		return letter_to;
	}

	public void setLetter_to(String letter_to) {
		this.letter_to = letter_to;
	}

	public String getLetter_from() {
		return letter_from;
	}

	public void setLetter_from(String letter_from) {
		this.letter_from = letter_from;
	}

	public String getLetter_title() {
		return letter_title;
	}

	public void setLetter_title(String letter_title) {
		this.letter_title = letter_title;
	}

	public String getLetter_content() {
		return letter_content;
	}

	public void setLetter_content(String letter_content) {
		this.letter_content = letter_content;
	}

	public Date getLetter_regdate() {
		return letter_regdate;
	}

	public void setLetter_regdate(Date letter_regdate) {
		this.letter_regdate = letter_regdate;
	}

	public String getLetter_read() {
		return letter_read;
	}

	public void setLetter_read(String letter_read) {
		this.letter_read = letter_read;
	}



}
