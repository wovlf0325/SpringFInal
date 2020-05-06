package com.mvc.prectice.board.biz;

import java.util.List;

import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;

public interface BoardBiz {
	
	public BoardDto selectOne(int board_no);
	public int insert(BoardDto boarddto);
	public int update(BoardDto boarddto);
	public int delete(int board_no);
	
	public int countBoard();
	public List<BoardDto> selectBoard(PagingDto pagingdto);


}
