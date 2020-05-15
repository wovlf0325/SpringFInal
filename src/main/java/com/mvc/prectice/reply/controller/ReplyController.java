package com.mvc.prectice.reply.controller;


import java.util.List;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.prectice.board.biz.BoardBiz;
import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.login.dto.LoginDto;
import com.mvc.prectice.reply.biz.ReplyBiz;
import com.mvc.prectice.reply.dto.ReplyDto;


@Controller
public class ReplyController {
	
	@Autowired
	private ReplyBiz replybiz;
	@Autowired
	private BoardBiz boardbiz;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	/*
	@RequestMapping("replyinsert.do")
	public void replyInsert(Model model, @ModelAttribute ReplyDto replydto, HttpSession session) {
		
		logger.info("replyinsert");
		
		String member_id = (String)session.getAttribute("member_id");
		System.out.println(member_id);
		replydto.setMember_id(member_id);
	
		model.addAttribute("replydto",replybiz.replyInsert(replydto));
	}
	*/
	
	@RequestMapping(value="/replylist.do")
	public String replyList(Model model,HttpSession session, int board_no) {
		
		logger.info("REPLYLIST");
		
		List<ReplyDto> replylist = replybiz.replyList(board_no);
		
		model.addAttribute("replylist", replylist);
		model.addAttribute("boarddto", boardbiz.selectOne(board_no));
		
		return "reply/replylist";
	}
	
	@RequestMapping(value="/replyinsert.do", method = RequestMethod.POST)
	@ResponseBody
	public void replyinsert(Model model, ReplyDto replydto, HttpSession session) {
		logger.info("REPLYINSERT");
		
		LoginDto logindto =(LoginDto) session.getAttribute("logininfo");
		System.out.println(logindto.getMember_id());
		
		replydto.setMember_id(logindto.getMember_id());
		
		model.addAttribute("replydto", replybiz.replyInsert(replydto));
		
		System.out.println("댓글작성성공");
		
		
	}
	
	@RequestMapping(value="/replydelete.do")
	@ResponseBody
	public void replydelete(Model model, @RequestParam("reply_no") int reply_no) {
		logger.info("REPLYDELETE");
		
		int res = replybiz.replyDelete(reply_no);
	}
	
	@RequestMapping(value="/replyupdate.do", method = RequestMethod.POST)
	@ResponseBody
	public void replyupdate(Model model, String reply_content, int reply_no) {
		logger.info("REPLYUPDATE");
		
		int res = replybiz.replyUpdate(reply_content, reply_no);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
