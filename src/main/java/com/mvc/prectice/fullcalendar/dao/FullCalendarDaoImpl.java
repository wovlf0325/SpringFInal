package com.mvc.prectice.fullcalendar.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.fullcalendar.dto.FullCalendarDto;

@Repository
public class FullCalendarDaoImpl implements FullCalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FullCalendarDto> selectList() {
		 //TODO Auto-generated method stub
		List<FullCalendarDto> list = new ArrayList<FullCalendarDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
	} catch (Exception e) {
	// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error: 오우쉣");
			
		}
		System.out.println(list);
		return list;
	}

	@Override
	public FullCalendarDto selectOne(int plan_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(FullCalendarDto fullcalendarDto) {

		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",fullcalendarDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error : insert" + res);
			
		}
		
		return res;
	}

}
