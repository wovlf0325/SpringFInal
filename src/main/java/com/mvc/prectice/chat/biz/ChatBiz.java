package com.mvc.prectice.chat.biz;

import java.util.List;

import com.mvc.prectice.chat.dto.ChatListDto;
import com.mvc.prectice.chat.dto.ChatRoomDto;
import com.mvc.prectice.chat.dto.MassageDto;

public interface ChatBiz {
	// 채팅방
	public int ChatRoom_insert(ChatRoomDto dto);
	public int ChatRoom_delete(int chatroom_no);
	public List<ChatRoomDto> ChatRoom_selectList();
	
	// 채팅참여자
	public int ChatList_insert(int chatroom_no, int member_no);
	public int ChatList_update(ChatListDto dto);
	public int ChatList_delete(int chatroom_no, int member_no);
	
	//채팅메시지
	public int Chat_insert(MassageDto dto);
	public List<MassageDto> Chat_List(int chatroom_no);
	
}
