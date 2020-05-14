package com.mvc.prectice.login.biz;

import org.springframework.stereotype.Service;

import com.mvc.prectice.login.dto.LoginDto;

@Service
public interface LoginBiz {

	public LoginDto selectInfo(LoginDto logindto);
	public LoginDto selectInfoWhereId(LoginDto logindto);
	public int updateMypage(LoginDto logindto);
	
}
