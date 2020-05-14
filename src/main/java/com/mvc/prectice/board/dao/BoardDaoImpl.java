package com.mvc.prectice.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;
import com.mvc.prectice.reply.dto.ReplyDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//private ReplyDto comment;
	//private ArrayList<ReplyDto> comments;
	
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

	@Override
	public List<BoardDto> listSearch(BoardDto boarddto, PagingDto pagingdto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", boarddto.getBoard_no());
		map.put("searchType",boarddto.getSearchType());
		map.put("keyword", boarddto.getKeyword());
		map.put("start", pagingdto.getStart());
		map.put("end", pagingdto.getEnd());
		map.put("category", boarddto.getBoard_category());
		
		System.out.print("searchType: "+map.get("searchType"));
		System.out.print(" / keyword: "+map.get("keyword"));
		System.out.print(" / start: "+map.get("start"));
		System.out.print(" / end: "+map.get("end"));
		System.out.println(" / category: " + map.get("category"));
		System.out.println();
		
		List<BoardDto> boardlist = new ArrayList<BoardDto>();
		
		try {
			boardlist = sqlSession.selectList(NAMESPACE+"listSearch", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR]: listSearch");
		}
		
		return boardlist;
	}

	@Override
	public int countSearch(BoardDto boarddto) {
		
		int res = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", boarddto.getSearchType());
		map.put("keyword", boarddto.getKeyword());
		map.put("category", boarddto.getBoard_category());
		
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"countSearch", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR]: countSearch");
		}
		
		return res;
	}

	@Override
	public int countComments(int board_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<BoardDto> selectNotice() {
		List<BoardDto> boardlist = new ArrayList<BoardDto>();
		
		try {
			boardlist = sqlSession.selectList(NAMESPACE+"selectNotice");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR]: selectNotice");
		}
		
		return boardlist;
	}

}
