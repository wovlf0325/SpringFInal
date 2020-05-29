package com.mvc.prectice.letter.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;
import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.letter.biz.LetterBiz;
import com.mvc.prectice.letter.dto.LetterDto;
import com.mvc.prectice.login.dto.LoginDto;

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
			out.println(letterdto.getLetter_no());
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
		} else {
			System.out.println("letterdto : null");
		}
	}
	
	@RequestMapping(value="/letterlist.do")
	public String letterList(Model model, LetterDto letterdto, HttpSession session) {
		logger.info("LETTERLIST");
		
		LoginDto logindto = (LoginDto) session.getAttribute("logininfo");
		String id = logindto.getMember_id();
		
		List<LetterDto> letterlist = letterbiz.letterList(id);
		
		model.addAttribute("letterlist", letterlist);
		
		System.out.println(logindto.getMember_id());
		
		return "letter/letterlist";
	}
	
	@RequestMapping(value = "/letterdetail.do")
	public String letterOne(Model model, String letter_to, int letter_no) {

		logger.info("SELECT ONE");
		
		LetterDto letterdto = letterbiz.letterOne(letter_to, letter_no);
		
		System.out.println("보낸이: "+letterdto.getLetter_from());
		System.out.println("받는이: "+letterdto.getLetter_to());
		System.out.println("쪽지번호: "+letterdto.getLetter_no());
		
		model.addAttribute("letterdto", letterdto);

		return "letter/letterdetail";
	}
	
	@RequestMapping(value = "/letterinsert.do")
	public String letterInsert(Model model, LetterDto letterdto, HttpSession session, String from) {

		logger.info("INSERT");
		
		LoginDto logindto = (LoginDto)session.getAttribute("logininfo");
		letterdto.setLetter_from(logindto.getMember_id());
		
		
		model.addAttribute("letterdto", letterdto);
		model.addAttribute("from", from);
		
		return "letter/letterinsert";
	}
	
	@RequestMapping(value = "/letterinsertres.do")
	public void letterInsertres(Model model, HttpServletResponse response, LetterDto letterdto ) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		logger.info("INSERTRES");
		
		int res = letterbiz.letterInsert(letterdto);

		//model.addAttribute("letterdto", res);

		if(res > 0) {
			out.println("<script type='text/javascript'>");
			out.println("alert('쪽지 작성 성공');");
			out.println("opener.location.reload();");
			out.println("self.close();");
			out.println("</script>");
		} else {
			System.out.println("작성 실패");
			// jsResponse("작성 실패", "/Letter/letter.jsp", response);
		}
		
	}
	
	@RequestMapping(value = "/letterdelete.do")
	public void letterDelete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		logger.info("LETTERDELETE");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String[] seqs = request.getParameterValues("chk");
		String command = request.getParameter("command");
		String command_2 = request.getParameter("command_2");
		
		System.out.println(command);
		
		PrintWriter out = response.getWriter();

		int res = letterbiz.letterDelete(seqs);
		
		//model.addAttribute("letterdto", res);
		
		if(command.equals("deleteone")) {
			
			if(res > 0) {
				out.println("<script type='text/javascript'>");
				out.println("alert('쪽지 삭제 성공');");
				out.println("opener.location.reload();");
				out.println("self.close();");
				out.println("</script>");
			} else {
				System.out.println("삭제 실패");
			}
			
		}else if(command.equals("multidelete")) {
			
			if(command_2.equals("send")) {
				jsResponse("삭제 성공","lettersend.do",response);
			}else if(command_2.equals("receive")){
				jsResponse("삭제 성공","letterlist.do",response);
			}
			
		}
		
	}
	
	@RequestMapping(value="/lettersend.do")
	public String letterSend(Model model, LetterDto letterdto, HttpSession session) {
		
		logger.info("LETTERSEND");
		
		LoginDto logindto = (LoginDto) session.getAttribute("logininfo");
		String letter_from = logindto.getMember_id();
		
		List<LetterDto> lettersend = letterbiz.letterSend(letter_from);
		
		model.addAttribute("lettersend", lettersend);
		
		System.out.println("letter_from"+logindto.getMember_id());
		
		return "letter/lettersend";
		
	}
	
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"');");
		out.println("location.href='"+url+"';");
		out.println("</script>");
	}
	
	
	
}
