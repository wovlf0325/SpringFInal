package com.mvc.prectice.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvc.prectice.board.biz.BoardBiz;
import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;

@Controller
public class BoardController {

	@Autowired
	private BoardBiz boardbiz;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);


	// 글목록 +페이징+검색
	@RequestMapping(value = "/boardlist.do", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("boarddto") BoardDto boarddto,
			@ModelAttribute("pagingdto") PagingDto pagingdto, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "boardcategory", required = false) String category){

		logger.info("LISTSEARCH");
		

		if (nowPage == null) {
			nowPage = "1";
		}
		if (cntPerPage == null) {
			cntPerPage = Integer.toString(pagingdto.getCntPage());
		}
		if (category == null) {
			category = "1";
		}
		
		
		boarddto.setBoard_category(Integer.parseInt(category));
		pagingdto = new PagingDto(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<BoardDto> searchlist = boardbiz.listSearch(boarddto, pagingdto);
		int total = boardbiz.countSearch(boarddto);
		pagingdto.calcLastPage(total, Integer.parseInt(cntPerPage));
		pagingdto.calcStartEndPage(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		model.addAttribute("boardlist", searchlist);
		model.addAttribute("paging", pagingdto);
		model.addAttribute("boarddto", boarddto);
		model.addAttribute("notice", boardbiz.selectNotice());

		return "board/boardlist";

	}

	@RequestMapping(value = "/boarddetail.do")
	public String selectOne(Model model, int board_no) {

		logger.info("SELECT ONE");

		model.addAttribute("boarddto", boardbiz.selectOne(board_no));

		return "board/boarddetail";
	}

	@RequestMapping(value = "/boardinsert.do")
	public String insert(Model model) {

		logger.info("INSERT");

		return "board/boardinsert";
	}

	@RequestMapping(value = "/boardinsertres.do")
	public String insertres(Model model, BoardDto boarddto) {

		logger.info("INSERTRES");

		model.addAttribute("boarddto", boardbiz.insert(boarddto));

		System.out.println("글작성 성공");

		return "redirect:boardlist.do?nowPage=1";
	}

	@RequestMapping(value = "/boarddelete.do")
	public String delete(Model model, int board_no) {

		logger.info("DELETE");

		model.addAttribute("boarddto", boardbiz.delete(board_no));

		System.out.println("글삭제 성공");

		return "redirect:boardlist.do?nowPage=1";
	}

	@RequestMapping(value = "/boardupdateform.do")
	public String updateForm(Model model, int board_no) {
		logger.info("UPDATE FORM");

		BoardDto boarddto = boardbiz.selectOne(board_no);
		model.addAttribute("boarddto", boarddto);

		return "board/boardupdate";
	}

	@RequestMapping(value = "/boardupdateres.do", method = RequestMethod.POST)
	public String updateRes(BoardDto boarddto) {
		logger.info("UPDATE RESULT");

		int res = boardbiz.update(boarddto);
		if (res > 0) {
			return "redirect:boarddetail.do?board_no=" + boarddto.getBoard_no();
		} else {
			return "redirect:boardupdateform.do?board_no=" + boarddto.getBoard_no();
		}

	}

}
