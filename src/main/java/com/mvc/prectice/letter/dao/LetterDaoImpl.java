package com.mvc.prectice.letter.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.letter.dto.LetterDto;

@Repository
public class LetterDaoImpl implements LetterDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public LetterDto selectNewLetter(String id) {
		LetterDto dto = new LetterDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectNewLetter",id);
		} catch (Exception e) {
			System.out.println("[error]:selectNewLetter");
			e.printStackTrace();
		}
		
		return dto;
	}

}
