package com.mvc.prectice.gagu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.gagu.dto.GaguDto;

@Repository
public class GaguDaoImpl {
	
	String NAMESPACE ="gagu.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int gaguinsert(List<GaguDto> gagus) {
		int res =0;
				
		try {
			for(GaguDto gagudto: gagus) {
				res = sqlSession.insert(NAMESPACE + "gaguInsert", gagudto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR]: insert");
		}

		return res;
	}

}
