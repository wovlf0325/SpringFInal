package com.mvc.prectice.letter.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.prectice.letter.dto.LetterDto;

@Service
public interface LetterBiz {

	public LetterDto selectNewLetter(String id);
	
	//받은 쪽지 목록
	public List<LetterDto> letterList(String id);
	
	//보낸 쪽지 목록
	public List<LetterDto> letterSend(String letter_from);
	
	//쪽지 상세 정보
	public LetterDto letterOne(String letter_to, int letter_no);
	//쪽지 작성
	public int letterInsert(LetterDto letterdto);
	//쪽지 삭제
	public int letterDelete(String[] seqs);
	
	
}
