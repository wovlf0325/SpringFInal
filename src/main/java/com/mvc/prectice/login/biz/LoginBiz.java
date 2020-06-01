package com.mvc.prectice.login.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.prectice.login.dto.LoginDto;
import com.mvc.prectice.payment.dto.Payment;

@Service
public interface LoginBiz {

	public LoginDto selectInfo(LoginDto logindto);
	public LoginDto selectInfoWhereId(LoginDto logindto);
	public int updateMypage(LoginDto logindto);
	public List<Payment> payment_list(String member_name);
	
}
