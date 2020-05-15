package com.mvc.prectice.reply.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.reply.dao.ReplyDao;
import com.mvc.prectice.reply.dto.ReplyDto;

@Service
public class ReplyBizImpl implements ReplyBiz {
	
	@Autowired
	private ReplyDao replydao;

	@Override
	public List<ReplyDto> replyList(int board_no) {
		return replydao.replyList(board_no);
	}

	@Override
	public int replyInsert(ReplyDto replydto) {
		return replydao.replyInsert(replydto);
	}

	@Override
	public int replyUpdate(String reply_content, int reply_no) {
		return replydao.replyUpdate(reply_content, reply_no);
	}

	@Override
	public int replyDelete(int reply_no) {
		return replydao.replyDelete(reply_no);
	}

}
