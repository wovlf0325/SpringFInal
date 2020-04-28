package com.mvc.prectice.home.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/section.do")
	public String MoveHome(Model model) {
		logger.info("Move Home");
		return "section";
	}
	
}
