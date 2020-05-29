package com.mvc.prectice.chat.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.prectice.chat.biz.ChatBiz;
import com.mvc.prectice.chat.dto.ChatRoomDto;
import com.mvc.prectice.chat.dto.MassageDto;



@Controller
public class ChatController {
	
	@Autowired
	private ChatBiz biz;
	
	@RequestMapping(value="/chat.do")
    public String getChatViewPage(Model model, int chatroomnum) {
		List<MassageDto> list = new ArrayList<MassageDto>();
		list = biz.Chat_List(chatroomnum);
        model.addAttribute("chatroomnum", chatroomnum);
        model.addAttribute("chatlist", list);
        return "chat/chat";
    }
	
	@RequestMapping(value="/chatlist.do")
	public String ChatList(Model model) {
		model.addAttribute("chatroomlist", biz.ChatRoom_selectList());
		return "chat/chatlist";
	}
	
	@RequestMapping(value="/createchatroom.do")
	public String CreateChatRoom(Model model, ChatRoomDto dto) {
		int res = biz.ChatRoom_insert(dto);
		if(res > 0) {
			System.out.println("채팅방 생성 성공");
		} else {
			System.out.println("채팅방 생성 실패");
		}
		return "redirect:chatlist.do";
	}
	 
	@RequestMapping(value="/joinchatroom.do")
	public String JoinChatRoom(Model model, int chatroom_no, int member_no) {
		int res = biz.ChatList_insert(chatroom_no, member_no);
		if (res > 1) {
			System.out.println("채팅방 신규입장 성공");
			return "redirect:chat.do?chatroomnum="+chatroom_no;
		} else if(res == 1){
			System.out.println("채팅방 재입장 성공");
			return "redirect:chat.do?chatroomnum="+chatroom_no;
		} else {
			System.out.println("채팅방 입장 실패");
			return "redirect:chatlist.do";
		}
	}
	
	@RequestMapping(value="/chatout.do")
	public String ChatOut(int chatroom_no, int member_no) {
		int res = biz.ChatList_delete(chatroom_no,member_no);
		if(res > 0) {
			System.out.println("채팅방 퇴장 성공");
		} else {
			System.out.println("채팅방 퇴장 실패");
		}
		return "redirect:chatlist.do";
	}
	
	@RequestMapping(value="/messageinsert.do")
	@ResponseBody
	public void MessageInsert(String message, int chatroom_no, int member_no) {
		MassageDto dto = new MassageDto();
		dto.setMassage_content(message);
		dto.setChatroom_no(chatroom_no);
		dto.setMember_no(member_no);
		int res = biz.Chat_insert(dto);
		if(res > 0) {
			System.out.println("메세지 저장 성공");
		} else {
			System.out.println("메세지 저장 실패");
		}
	}
	
	
}
