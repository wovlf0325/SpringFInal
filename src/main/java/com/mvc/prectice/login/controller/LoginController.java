package com.mvc.prectice.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.prectice.login.biz.LoginBiz;
import com.mvc.prectice.login.dto.LoginDto;

@Controller
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginBiz loginbiz;
	
	@RequestMapping(value = "/login.do")
	public String Login(Model model) {
		logger.info("Login");
		return "login";
	}
	
	
	@RequestMapping(value = "/loginRes.do",method = RequestMethod.POST)
	public String LoginRes(LoginDto logindto, HttpServletRequest request) {
		System.out.println("ok");
		LoginDto dto = new LoginDto();
		dto = loginbiz.selectInfo(logindto); 
		System.out.println(dto.getId());
		if(dto != null) {
			HttpSession session = request.getSession();
			System.out.println("정상 - " + dto.getId());
			session.setAttribute("logininfo", dto);
			return "section";
			
		}else {
			System.out.println("로그인 실패");
			return "redirect:login.do";
		}
	}
	@RequestMapping("/updateform.do")
	public String updateform(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginDto dto = (LoginDto) session.getAttribute("logininfo");
		if (dto == null) return "redirect:login.do";
		System.out.println("test");
		return "updateform";
	}
	

	@RequestMapping(value = "/getLoginInfo",method = RequestMethod.GET)
	@ResponseBody
	public LoginDto getLastLetterSeq(HttpServletRequest request) throws IOException {
		// 임의적으로 아이디: admin 값 받는지 확인
		LoginDto dto = new LoginDto();
		dto.setId("admin");
		dto = loginbiz.selectInfoWhereId(dto);
		
		//로그인 문제가 해결되면 위 3줄 제거후 아래 주석 해제하자
//		HttpSession session = request.getSession();
//		dto = loginDao.selectInfoWhereId((LoginDto) session.getAttribute("logininfo"));

		return dto;
	}
	@RequestMapping(value = "/updateMember",method = RequestMethod.POST)
	public String updateMember(

			@RequestParam("id")String id, 
			@RequestParam("pw")String pw,
			@RequestParam("name")String name,
			@RequestParam("email")String email,
			@RequestParam("phone")String phone,
			@RequestParam("address")String address,
			@RequestParam("interest")String interest,
			@RequestParam("area")String area,
			@RequestParam("role")String role,
			@RequestParam("status")String status) {
		loginbiz.updateMypage(new LoginDto(id, pw, name, phone, email, address, null, null, null, area, interest, role, status));
		return "redirect:updateform.do";
	}
	
}
