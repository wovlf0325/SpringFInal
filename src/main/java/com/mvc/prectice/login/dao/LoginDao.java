package com.mvc.prectice.login.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.login.dto.LoginDto;
import com.mvc.prectice.payment.dto.Payment;


@Repository
public interface LoginDao {

	String NAMESPACE = "loginquery.";
	public LoginDto selectInfo(LoginDto logindto);
	int updateMypage(LoginDto logindto);
	public LoginDto selectInfoWhereId(LoginDto logindto);
	public int addPayment(Payment p);
	public List<Payment> payment_list(String member_name);
	
}
