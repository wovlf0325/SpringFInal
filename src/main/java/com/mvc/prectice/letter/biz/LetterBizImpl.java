package com.mvc.prectice.letter.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.letter.dao.LetterDao;
import com.mvc.prectice.letter.dto.LetterDto;

@Service
public class LetterBizImpl implements LetterBiz{

	@Autowired
	private LetterDao dao;
	
	@Override
	public LetterDto selectNewLetter(String id) {
		// TODO Auto-generated method stub
		return dao.selectNewLetter(id);
	}

}
