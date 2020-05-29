package com.mvc.prectice.letter.biz;

import java.util.List;

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
		return dao.selectNewLetter(id);
	}

	@Override
	public List<LetterDto> letterList(String id) {
		return dao.letterList(id);
	}
	
	@Override
	public List<LetterDto> letterSend(String letter_from) {
		// TODO Auto-generated method stub
		return dao.letterSend(letter_from);
	}

	@Override
	public LetterDto letterOne(String letter_to, int letter_no) {
		return dao.letterOne(letter_to, letter_no);
	}

	@Override
	public int letterInsert(LetterDto letterdto) {
		return dao.letterInsert(letterdto);
	}


	@Override
	public int letterDelete(String[] seqs) {
		return dao.letterDelete(seqs);
	}

	

}
