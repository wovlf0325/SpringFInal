package com.mvc.prectice.gagu.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.gagu.dao.GaguDaoImpl;
import com.mvc.prectice.gagu.dto.GaguDto;

@Service
public class GaguBizImpl {
	
	@Autowired
	private GaguDaoImpl gagudao;
	
	public int gaguinsert(List<GaguDto> gagus) {
		return gagudao.gaguinsert(gagus);
	}


}
