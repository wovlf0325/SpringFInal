package com.mvc.prectice.house.biz;

import java.util.List;

import com.mvc.prectice.house.dto.HouseDto;

public interface HouseBiz {

	public List<HouseDto> selectList();
	public HouseDto selectOne(int house_id);
	public int insert(HouseDto housedto);
	public int update(HouseDto housedto);
	public int delete(int house_id);
	
	
}
