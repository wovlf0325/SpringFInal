package com.mvc.prectice.house.dao;

import java.util.List;

import com.mvc.prectice.house.dto.HouseDto;
import com.mvc.prectice.house.dto.PagingDto;

public interface HouseDao {

	String NAMESPACE ="house.";
	
	public List<HouseDto> selectList(PagingDto pagingdto);
	public HouseDto selectOne(int house_id);
	public int insert(HouseDto housedto);
	public int update(HouseDto housedto);
	public int delete(int house_id);
	
	// 게시물 총 개수
	public int countHouse();
	
}
