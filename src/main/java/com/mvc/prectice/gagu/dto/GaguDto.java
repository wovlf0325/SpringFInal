package com.mvc.prectice.gagu.dto;

public class GaguDto {
	
	
	private String region;
	private String gender;
	private int agesum;
	private int miman_20;
	private int n_20;
	private int n_30;
	private int n_40;
	private int n_50;
	private int n_60;
	private int n_70;
	private int isang_80;
	
	public GaguDto() {
		super();
	}

	public GaguDto(String region, String gender, int agesum, int miman_20, int n_20, int n_30, int n_40,
			int n_50, int n_60, int n_70, int isang_80) {
		super();
		
		this.region = region;
		this.gender = gender;
		this.agesum = agesum;
		this.miman_20 = miman_20;
		this.n_20 = n_20;
		this.n_30 = n_30;
		this.n_40 = n_40;
		this.n_50 = n_50;
		this.n_60 = n_60;
		this.n_70 = n_70;
		this.isang_80 = isang_80;
	}

	
	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAgesum() {
		return agesum;
	}

	public void setAgesum(int agesum) {
		this.agesum = agesum;
	}

	public int getMiman_20() {
		return miman_20;
	}

	public void setMiman_20(int miman_20) {
		this.miman_20 = miman_20;
	}

	public int getN_20() {
		return n_20;
	}

	public void setN_20(int n_20) {
		this.n_20 = n_20;
	}

	public int getN_30() {
		return n_30;
	}

	public void setN_30(int n_30) {
		this.n_30 = n_30;
	}

	public int getN_40() {
		return n_40;
	}

	public void setN_40(int n_40) {
		this.n_40 = n_40;
	}

	public int getN_50() {
		return n_50;
	}

	public void setN_50(int n_50) {
		this.n_50 = n_50;
	}

	public int getN_60() {
		return n_60;
	}

	public void setN_60(int n_60) {
		this.n_60 = n_60;
	}

	public int getN_70() {
		return n_70;
	}

	public void setN_70(int n_70) {
		this.n_70 = n_70;
	}

	public int getIsang_80() {
		return isang_80;
	}

	public void setIsang_80(int isang_80) {
		this.isang_80 = isang_80;
	}

	
}
