package com.mvc.prectice.login.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.login.dto.LoginDto;


@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public LoginDto selectInfo(LoginDto logindto) {
		LoginDto dto = new LoginDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectInfo",logindto);
		} catch (Exception e) {
			System.out.println("[error]:selectInfo");
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public LoginDto selectInfoWhereId(LoginDto logindto) {
		LoginDto dto = new LoginDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectInfoWhereId",logindto);
		} catch (Exception e) {
			System.out.println("[error]:selectInfo");
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public int updateMypage(LoginDto loginDto) {
		int row = 0;
		try {
			row = sqlSession.update(NAMESPACE + "updateMypage", loginDto);
		} catch (Exception e) {
			System.out.println("[error]:updateMypage");
			e.printStackTrace();
		}
		return row;
	}
}
