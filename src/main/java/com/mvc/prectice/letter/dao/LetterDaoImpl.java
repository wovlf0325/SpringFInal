package com.mvc.prectice.letter.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<LetterDto> letterList(String id) {
		
		List<LetterDto> letterlist = new ArrayList<LetterDto>();
		
		try {
			letterlist = sqlSession.selectList(NAMESPACE+"letterList",id);
		} catch (Exception e) {
			System.out.println("[error]:letterList");
			e.printStackTrace();
		}
		
		return letterlist;
	}
	
	
	@Override
	public List<LetterDto> letterSend(String letter_from) {
		
		List<LetterDto> lettersend = new ArrayList<LetterDto>();
		
		try {
			lettersend = sqlSession.selectList(NAMESPACE+"letterSend", letter_from);
		} catch (Exception e) {
			System.out.println("[error]:lettersend");
			e.printStackTrace();
		}
		
		return lettersend;
	}


	@Override
	public LetterDto letterOne(String letter_to, int letter_no) {
		
		LetterDto letterdto = new LetterDto();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("letter_to", letter_to);
		map.put("letter_no", letter_no);
		
		System.out.println("daoimpl-letter_to"+map.get("letter_to"));
		System.out.println("daoimpl-letter_no"+map.get("letter_no"));
		
		try {
			letterdto = sqlSession.selectOne(NAMESPACE+"letterOne", map);
		} catch (Exception e) {
			System.out.println("[error]:letterOne");
			e.printStackTrace();
		}
		
		return letterdto;
	}

	@Override
	public int letterInsert(LetterDto letterdto) {
		
		int res =0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"letterInsert", letterdto);
		} catch (Exception e) {
			System.out.println("[error]:letterInsert");
			e.printStackTrace();
		}
		
		return res;
	}


	@Override
	public int letterDelete(String[] seqs) {
		
		int res =0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seqs", seqs);
		
		try {
			res = sqlSession.delete(NAMESPACE+"letterDelete", map);
		} catch (Exception e) {
			System.out.println("[error]:letterDelete");
			e.printStackTrace();
		}
		
		return res;
	}

	
}
