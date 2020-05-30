package com.mvc.prectice.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.prectice.login.dao.LoginDao;
import com.mvc.prectice.payment.dto.Payment;

@Controller
public class PaymentController {

	@Autowired private LoginDao loginDao;
	@RequestMapping("/payment.do")
	public String payment(
			@RequestParam(value="house_name")String house_name, Model model,
			@RequestParam(value="house_id") int house_id) {
		
		model.addAttribute("house_name", house_name);
		model.addAttribute("house_id", house_id);
		
		
		return "payment";
	}
	// 6
	@RequestMapping("/paycomplete.do")
	public ModelAndView paycomplete(
			@RequestParam(value= "email") String email,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "uid") String uid, 
			@RequestParam(value = "amount") int amount){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("paycomplete");
		// 7
		mav.addObject("email", email);
		mav.addObject("name", name);
		mav.addObject("uid", uid);
		mav.addObject("amount", amount);
		
		return mav;
	}
	
	@RequestMapping(value = "/paymentProc.do")
	@ResponseBody
	// 3
	public String paymentProc(
		@RequestParam(value = "email") String email,
		@RequestParam(value = "house_id") int house_id,
		@RequestParam(value = "memberName") String memberName,
		@RequestParam(value = "paymentUID") String paymentUID,
		@RequestParam(value = "paymentAmount") int paymentAmount
	) {
		String member_email = email;
		String member_name = memberName;
		System.out.println(member_email);
		System.out.println(member_name);
		System.out.println(house_id);
		System.out.println(paymentUID);
		System.out.println(paymentAmount);
		
		
		return "{ \"result\" : "+ loginDao.addPayment(new Payment(0, member_email, member_name, house_id, paymentUID, paymentAmount)) +" }";
	}
}
