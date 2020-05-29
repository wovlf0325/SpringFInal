package com.mvc.prectice.chat.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.chat.dao.ChatDao;
import com.mvc.prectice.chat.dto.ChatListDto;
import com.mvc.prectice.chat.dto.ChatRoomDto;
import com.mvc.prectice.chat.dto.MassageDto;

@Service
public class ChatBizImpl implements ChatBiz {
	
	@Autowired
	private ChatDao dao;

	@Override
	public int ChatRoom_insert(ChatRoomDto dto) {
		return dao.ChatRoom_insert(dto);
	}

	@Override
	public int ChatRoom_delete(int chatroom_no) {
		// TODO Auto-generated method stub
		return dao.ChatRoom_delete(chatroom_no);
	}

	@Override
	public List<ChatRoomDto> ChatRoom_selectList() {
		return dao.ChatRoom_selectList();
	}

	@Override
	public int ChatList_insert(int chatroom_no, int member_no) {
		if(0 < dao.ChatList_check(chatroom_no, member_no)) {
			return 1;
		} else {
			int res = dao.ChatList_insert(chatroom_no, member_no);
			if(0 < res){
				res += dao.ChatRoom_update(chatroom_no);
				if(1 < res) {
					return res;
				} else {
					return 0;
				}
			} else {
				return 0;
			}
		}
	}

	@Override
	public int ChatList_update(ChatListDto dto) {
		// TODO Auto-generated method stub
		return dao.ChatList_update(dto);
	}

	@Override
	public int ChatList_delete(int chatroom_no, int member_no) {
		int res = dao.ChatList_delete(chatroom_no, member_no);
		if(res > 0) {
			dao.ChatRoom_update(chatroom_no);
			return res;
		} else {
			return 0;
		}
	}

	@Override
	public int Chat_insert(MassageDto dto) {
		return dao.Chat_insert(dto);
	}

	@Override
	public List<MassageDto> Chat_List(int chatroom_no) {
		return dao.Chat_List(chatroom_no);
	}

}
