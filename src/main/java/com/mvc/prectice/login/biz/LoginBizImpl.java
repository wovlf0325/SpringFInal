package com.mvc.prectice.login.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.login.dao.LoginDao;
import com.mvc.prectice.login.dto.LoginDto;
import com.mvc.prectice.payment.dto.Payment;

@Service
public class LoginBizImpl implements LoginBiz{

	@Autowired
	private LoginDao dao;
	
	@Override
	public LoginDto selectInfo(LoginDto logindto) {
		// TODO Auto-generated method stub
		return dao.selectInfo(logindto);
	}

	@Override
	public LoginDto selectInfoWhereId(LoginDto logindto) {
		// TODO Auto-generated method stub
		return dao.selectInfoWhereId(logindto);
	}

	@Override
	public int updateMypage(LoginDto logindto) {
		// TODO Auto-generated method stub
		return dao.updateMypage(logindto);
	}

	@Override
	public List<Payment> payment_list(String member_name) {
		// TODO Auto-generated method stub
		return dao.payment_list(member_name);
	}

}
