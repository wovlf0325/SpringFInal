package com.mvc.prectice.fullcalendar.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.fullcalendar.dao.FullCalendarDao;
import com.mvc.prectice.fullcalendar.dto.FullCalendarDto;

@Service
public class FullCalendarBizImpl implements FullCalendarBiz {
	
	@Autowired
	private FullCalendarDao dao;
	
	@Override
	public List<FullCalendarDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public FullCalendarDto selectOne(int plan_no) {
		// TODO Auto-generated method stub
		return dao.selectOne(plan_no);
	}

	@Override
	public int insert(FullCalendarDto fullcalendarDto) {
		// TODO Auto-generated method stub
		return dao.insert(fullcalendarDto);
	}

	@Override
	public int update(FullCalendarDto fullcalendarDto) {
		// TODO Auto-generated method stub
		return dao.update(fullcalendarDto);
	}

	@Override
	public int delete(int plan_no) {
		// TODO Auto-generated method stub
		return dao.delete(plan_no);
	}

}
