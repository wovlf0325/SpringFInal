package com.mvc.prectice.login.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.login.dto.LoginDto;
import com.mvc.prectice.payment.dto.Payment;


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
	
	@Override
	public int addPayment(Payment p) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updatePayment", p);
		} catch (Exception e) {
			System.out.println("[ERROR]:updatePayment");
			e.printStackTrace();
		}
		
		return sqlSession.insert("addPayment", p);
	}
	@Override
	public List<Payment> payment_list(String member_name) {
		List<Payment> list = new ArrayList<Payment>();
		try {
			list = sqlSession.selectList(NAMESPACE+"payment_list", member_name);
		} catch (Exception e) {
			System.out.println("ERROR : payment_list");
			e.printStackTrace();
		}
		
		return list;
	}
}
