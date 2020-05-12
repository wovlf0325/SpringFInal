package com.mvc.prectice.letter.dao;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.letter.dto.LetterDto;

@Repository
public interface LetterDao {

	String NAMESPACE = "letter.";
	public LetterDto selectNewLetter(String id);
}
