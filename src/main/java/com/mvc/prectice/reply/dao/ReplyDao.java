package com.mvc.prectice.reply.dao;

import java.util.List;

import com.mvc.prectice.reply.dto.ReplyDto;

public interface ReplyDao {
	
	String NAMESPACE ="reply.";
	
	// 댓글 목록
	public List<ReplyDto> replyList(int board_no);
	// 댓글 입력
	public int replyInsert(ReplyDto replydto);
	// 댓글 수정
	public int replyUpdate(String reply_content, int reply_no);
	// 댓글 삭제
	public int replyDelete(int reply_no);
	

}
