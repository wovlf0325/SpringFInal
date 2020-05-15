package com.mvc.prectice.fullcalendar.biz;

import java.util.List;

import com.mvc.prectice.fullcalendar.dto.FullCalendarDto;

public interface FullCalendarBiz {
	
	public List<FullCalendarDto> selectList();
	public FullCalendarDto selectOne(int plan_no);
	public int insert(FullCalendarDto fullcalendarDto);
	
}
