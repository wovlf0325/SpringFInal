package com.mvc.prectice.fullcalendar.dto;

public class FullCalendarDto {
	
	private int plan_no;
	private int house_id;
	private String title;
	private String start;
	private String end;
	public FullCalendarDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FullCalendarDto(int plan_no, int house_id, String title, String start, String end) {
		super();
		this.plan_no = plan_no;
		this.house_id = house_id;
		this.title = title;
		this.start = start;
		this.end = end;
	}
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public int getHouse_id() {
		return house_id;
	}
	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}
	public String getPlan_title() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlan_start() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getPlan_end() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	
	
}
