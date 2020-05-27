package com.mvc.prectice.house.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.house.dao.HouseDao;
import com.mvc.prectice.house.dto.HouseDto;

@Service
public class HouseBizImpl implements HouseBiz {

	@Autowired
	private HouseDao housedao;
	
	@Override
	public List<HouseDto> selectList() {
		return housedao.selectList();
	}

	@Override
	public HouseDto selectOne(int house_id) {
		return housedao.selectOne(house_id);
	}

	@Override
	public int insert(HouseDto housedto) {
		return housedao.insert(housedto);
	}

	@Override
	public int update(HouseDto housedto) {
		return housedao.update(housedto);
	}

	@Override
	public int delete(int house_id) {
		return housedao.delete(house_id);
	}

}
