package com.mvc.prectice.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public BoardDto selectOne(int board_no) {
		BoardDto boarddto = new BoardDto();
		
		try {
			boarddto = sqlSession.selectOne(NAMESPACE+"selectOne",board_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("[ERROR]: select one");
		}
		
		return boarddto;
	}

	@Override
	public int insert(BoardDto boarddto) {
		int res =0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", boarddto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR]: insert");
		}
		
		return res;
	}

	@Override
	public int update(BoardDto boarddto) {
		int res =0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"update", boarddto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR]: update");
		}
		
		return res;
	}

	@Override
	public int delete(int board_no) {
		int res=0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", board_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("[ERROR]: delete");
		}
		return res;
	}

	@Override
	public int countBoard() {
		int res =0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"countBoard");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR]: countboard");
		}
		
		return res;
	}

	@Override
	public List<BoardDto> selectBoard(PagingDto pagingdto) {
		List<BoardDto> boardlist = new ArrayList<BoardDto>();
		
		try {
			//pagingdto.setStart(pagingdto.getStart());
			//pagingdto.setEnd(pagingdto.getEnd());
			boardlist = sqlSession.selectList(NAMESPACE+"selectBoard", pagingdto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR]: selectboard");
		}
		
		return boardlist;
	}

}
