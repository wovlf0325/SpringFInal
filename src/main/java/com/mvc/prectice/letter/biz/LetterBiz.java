package com.mvc.prectice.letter.biz;

import org.springframework.stereotype.Service;

import com.mvc.prectice.letter.dto.LetterDto;

@Service
public interface LetterBiz {

	public LetterDto selectNewLetter(String id);
}
