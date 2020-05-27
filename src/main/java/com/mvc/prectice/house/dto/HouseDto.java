package com.mvc.prectice.house.dto;


public class HouseDto {

	private int house_id;
	private int house_keeper;
	private String house_name;
	private String house_phone;
	private String house_addr;
	private String house_image;
	private String house_content;
	private String house_document;
	private String house_status;
	
	public HouseDto() {
	}

	public HouseDto(int house_id, int house_keeper, String house_name, String house_phone, String house_addr,
			String house_image, String house_content, String house_document, String house_status) {
		this.house_id = house_id;
		this.house_keeper = house_keeper;
		this.house_name = house_name;
		this.house_phone = house_phone;
		this.house_addr = house_addr;
		this.house_image = house_image;
		this.house_content = house_content;
		this.house_document = house_document;
		this.house_status = house_status;
	}

	public int getHouse_id() {
		return house_id;
	}

	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}

	public int getHouse_keeper() {
		return house_keeper;
	}

	public void setHouse_keeper(int house_keeper) {
		this.house_keeper = house_keeper;
	}

	public String getHouse_name() {
		return house_name;
	}

	public void setHouse_name(String house_name) {
		this.house_name = house_name;
	}

	public String getHouse_phone() {
		return house_phone;
	}

	public void setHouse_phone(String house_phone) {
		this.house_phone = house_phone;
	}

	public String getHouse_addr() {
		return house_addr;
	}

	public void setHouse_addr(String house_addr) {
		this.house_addr = house_addr;
	}

	public String getHouse_image() {
		return house_image;
	}

	public void setHouse_image(String house_image) {
		this.house_image = house_image;
	}

	public String getHouse_content() {
		return house_content;
	}

	public void setHouse_content(String house_content) {
		this.house_content = house_content;
	}

	public String getHouse_document() {
		return house_document;
	}

	public void setHouse_document(String house_document) {
		this.house_document = house_document;
	}

	public String getHouse_status() {
		return house_status;
	}

	public void setHouse_status(String house_status) {
		this.house_status = house_status;
	}
	
	
	
	
	
	
}
