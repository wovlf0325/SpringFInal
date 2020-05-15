package com.mvc.prectice.reply.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.reply.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReplyDto> replyList(int board_no) {
		
		List<ReplyDto> replylist = new ArrayList<ReplyDto>();
		
		try {
			replylist = sqlSession.selectList(NAMESPACE+"replyList", board_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR] : replylist");
		}
		
		return replylist;
	}

	@Override
	public int replyInsert(ReplyDto replydto) {

		int res =0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"replyInsert", replydto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR] : replyinsert");
		}
		
		return res;
	}

	@Override
	public int replyUpdate(String reply_content, int reply_no) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("reply_content", reply_content);
		map.put("reply_no", reply_no );
		
		int res =0;
		
		try {
			res = sqlSession.update(NAMESPACE+"replyUpdate",map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR] : replyupdate");
		}
		return res;

	}

	@Override
	public int replyDelete(int reply_no) {
		
		int res =0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"replyDelete", reply_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR] : replyDelete");
		}
		
		return res;

	}

}
