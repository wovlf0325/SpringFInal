package com.mvc.prectice.board.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.board.dao.BoardDao;
import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;

@Service
public class BoardBizImpl implements BoardBiz {
	
	@Autowired
	private BoardDao boarddao;

	@Override
	public BoardDto selectOne(int board_no) {
		return boarddao.selectOne(board_no);
	}

	@Override
	public int insert(BoardDto boarddto) {
		return boarddao.insert(boarddto);
	}

	@Override
	public int update(BoardDto boarddto) {
		return boarddao.update(boarddto);
	}

	@Override
	public int delete(int board_no) {
		return boarddao.delete(board_no);
	}

	@Override
	public int countBoard() {
		return boarddao.countBoard();
	}

	@Override
	public List<BoardDto> selectBoard(PagingDto pagingdto) {
		return boarddao.selectBoard(pagingdto);
	}

	@Override
	public List<BoardDto> listSearch(BoardDto boarddto, PagingDto pagingdto) {
		return boarddao.listSearch(boarddto, pagingdto);
	}

	@Override
	public int countSearch(BoardDto boarddto) {
		return boarddao.countSearch(boarddto);
	}

}
