package com.mvc.prectice.home.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.prectice.login.dto.LoginDto;

@Controller
public class HomeController {

	private Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/section.do")
	public String MoveHome(Model model) {
		logger.info("Move Home");
		return "section";
	}
	
	@GetMapping("/write.do")
	public String boardWrite() {
	  return "board/BoardWrite";
	}
	
	@RequestMapping("/main.do")
	public String Main(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginDto dto = (LoginDto)session.getAttribute("logininfo");
		if(dto == null || dto.getId() == null) {
			return "redirect:login.do";
		} else {
			return "section";			
		}
		
	}
	
	
	
	
	
	
	
	
}
