package com.mvc.prectice.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.chat.dto.ChatListDto;
import com.mvc.prectice.chat.dto.ChatRoomDto;
import com.mvc.prectice.chat.dto.MassageDto;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int ChatRoom_insert(ChatRoomDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"chatroom_insert", dto);
		} catch (Exception e) {
			System.out.println("ERRPR : chatroom_insert");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int ChatRoom_TotalCount(int chatroom_no) {
		int res = 0;
		res = sqlSession.selectOne(NAMESPACE+"TotalCount", chatroom_no);
		return res;
	}
	
	@Override
	public int ChatRoom_update(int chatroom_no) {
		int res = 0;
		int count = ChatRoom_TotalCount(chatroom_no);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("chatroom_totalcount", count);
		map.put("chatroom_no", chatroom_no);
		res = sqlSession.update(NAMESPACE+"chatroom_update", map);
		return res;
	}

	@Override
	public int ChatRoom_delete(int chatroom_no) {
		return 0;
	}

	@Override
	public List<ChatRoomDto> ChatRoom_selectList() {
		List<ChatRoomDto> list = new ArrayList<ChatRoomDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"chatroom_selectList");
		} catch (Exception e) {
			System.out.println("ERROR : chatroom_selectList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int ChatList_insert(int chatroom_no, int member_no) {
		int res = 0;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("chatroom_no", chatroom_no);
		map.put("member_no", member_no);
		try {
			res = sqlSession.insert(NAMESPACE+"chatlist_insert", map);
		} catch (Exception e) {
			System.out.println("ERRPR : chatlist_insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int ChatList_update(ChatListDto dto) {
		
		return 0;
	}

	@Override
	public int ChatList_delete(int chatroom_no, int member_no) {
		int res = 0;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("chatroom_no", chatroom_no);
		map.put("member_no", member_no);
		try {
			res = sqlSession.delete(NAMESPACE+"chatlist_delete", map);
		} catch (Exception e) {
			System.out.println("ERRPR : chatlist_delete");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int ChatList_check(int chatroom_no, int member_no) {
		int res = 0;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("chatroom_no", chatroom_no);
		map.put("member_no", member_no);
		try {
			res = sqlSession.selectOne(NAMESPACE+"chatList_check", map);
		} catch (Exception e) {
			System.out.println("ERRPR : chatList_check");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int Chat_insert(MassageDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"chat_insert", dto);
		} catch (Exception e) {
			System.out.println("ERRPR : chat_insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<MassageDto> Chat_List(int chatroom_no) {
		List<MassageDto> list = new ArrayList<MassageDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"chatList", chatroom_no);
		} catch (Exception e) {
			System.out.println("ERRPR : chatList");
			e.printStackTrace();
		}
		return list;
	}

	

}
