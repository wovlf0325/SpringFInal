package com.mvc.prectice.board.dao;

import java.util.List;

import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;

public interface BoardDao {
	
	String NAMESPACE ="board.";
	
	public BoardDto selectOne(int board_no);
	public int insert(BoardDto boarddto);
	public int update(BoardDto boarddto);
	public int delete(int board_no);
	
	// 게시물 총 갯수
	public int countBoard();
	
	// 목록+페이징
	public List<BoardDto> selectBoard(PagingDto pagingdto);
	
	// 목록+페이징+검색
	public List<BoardDto> listSearch(BoardDto boarddto, PagingDto pagingdto);
	
	// 검색 결과 갯수
	public int countSearch(BoardDto boarddto);
	

	// 댓글 갯수
	public int countComments(int board_no);
	

	// 공지사항 3개 가져오기
	public List<BoardDto> selectNotice();
	
	public List<BoardDto> board_list(String member_id);
	
	public int updateview(int board_no);

}
