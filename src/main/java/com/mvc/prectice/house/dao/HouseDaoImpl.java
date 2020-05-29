package com.mvc.prectice.house.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.house.dto.HouseDto;
import com.mvc.prectice.house.dto.PagingDto;

@Repository
public class HouseDaoImpl implements HouseDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<HouseDto> selectList(PagingDto pagingdto) {
		List<HouseDto> list = new ArrayList<HouseDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", pagingdto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR: select list");
		}
		
		return list;
	}
	
	@Override
	public HouseDto selectOne(int house_id) {
		HouseDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", house_id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR : select one");
			
		}
		

		return dto;
	}

	@Override
	public int insert(HouseDto housedto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",housedto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR]: insert");
		}
		
		
		return res;
	}

	@Override
	public int update(HouseDto housedto) {

		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", housedto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR : UPDATE");
		}
		
		System.out.println(res);
		
		return res;
	}

	@Override
	public int delete(int house_id) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", house_id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR : DELETE");
		}
		return res;
	}

	@Override
	public int countHouse() {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"countHouse");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR : counthouse");
		}
		
		return res;
	}


	

}
