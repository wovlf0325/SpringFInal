package com.mvc.prectice.fullcalendar.dao;

import java.util.List;

import com.mvc.prectice.fullcalendar.dto.FullCalendarDto;

public interface FullCalendarDao {
	
	String NAMESPACE = "mycalendar.";
	
	public List<FullCalendarDto> selectList();
	public FullCalendarDto selectOne(int plan_no);
	public int insert(FullCalendarDto fullcalendarDto);
	
}
