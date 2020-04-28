package com.mvc.prectice.letter.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mvc.prectice.letter.biz.LetterBiz;
import com.mvc.prectice.letter.dto.LetterDto;

@Controller
public class LetterController {

	private Logger logger = LoggerFactory.getLogger(LetterController.class);
	
	@Autowired
	private LetterBiz letterbiz;
	
	@RequestMapping(value = "/getLastLetterSeq",method = RequestMethod.POST)   // 처음에 한번만 비동기통신으로 마지막 Seq를 return
	@ResponseBody
	public void getLastLetterSeq(@RequestParam("id")String id, HttpServletResponse response) throws IOException {
		logger.info("getLastLetterSeq");
		LetterDto letterdto = letterbiz.selectNewLetter(id);
		if(letterdto != null) {
			PrintWriter out = response.getWriter();
			out.println(letterdto.getLetterseq());
		}
	}
	
	@RequestMapping(value = "/ajaxLetterCall",method = RequestMethod.POST)
	@ResponseBody
	public void AjaxLetterCall(@RequestParam("id")String id, HttpServletResponse response, HttpServletRequest request) throws IOException {
		logger.info("AjaxLetterCall");
		System.out.println("로그인 된 아이디" + id);
		
		LetterDto letterdto = letterbiz.selectNewLetter(id);
		
		PrintWriter out = response.getWriter();
		if(letterdto != null) {
			
			Gson gson = new Gson();
			String jsonLetter = gson.toJson(letterdto);
			System.out.println("JSON으로 변환된 객체::" + jsonLetter);
			
			out.println(jsonLetter);
		}
	}
}
