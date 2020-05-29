package com.mvc.prectice.letter.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.letter.dto.LetterDto;

@Repository
public interface LetterDao {

	String NAMESPACE = "letter.";
	public LetterDto selectNewLetter(String id);
	
	public List<LetterDto> letterSend(String letter_from);
	public List<LetterDto> letterList(String id);
	
	public LetterDto letterOne(String letter_to, int letter_no);
	
	public int letterInsert(LetterDto letterdto);
	
	public int letterDelete(String[] seqs);
}
