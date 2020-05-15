package com.mvc.prectice.fullcalendar.controller;





import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mvc.prectice.fullcalendar.biz.FullCalendarBiz;
import com.mvc.prectice.fullcalendar.dto.FullCalendarDto;



@Controller
public class FullCalendarController {

	@Autowired
	private FullCalendarBiz biz;
	private static final Logger logger = LoggerFactory.getLogger(FullCalendarController.class);

	
	@RequestMapping(value = "/fullcalendar.do")
	public String FullCalendar(Model model) {

       logger.info("SELECT LIST로 잘왔다 !");	
       model.addAttribute("selectList",biz.selectList());
		return "fullcalendar";
	}
	
	@RequestMapping(value = "/planList.do")
	@ResponseBody
	public void planList(HttpSession sesion, HttpServletResponse response) throws Exception{
		
		logger.info("planList!!!!!!!!");
		
        List<FullCalendarDto> list = biz.selectList();
        
       Gson gson = new Gson();
       String plan = gson.toJson(list);
       System.out.println("우와 잠깐 들렸다 갑니다. : 영우"+plan);
       PrintWriter out = response.getWriter();
       out.print(plan);
	
	}
	
	@RequestMapping(value = "/fullcalendarpopup.do")
	public String FullCalendarPopup() {
		
		logger.info("팝업들어갑니다~");
		
		
		
		return "fullcalendarpopup";
	}
	
	//일정 추가 버튼 클릭 Ajax
		@ResponseBody
		@RequestMapping(value = "/fullcalendaradd.do", method = RequestMethod.POST)
		public Map<Object,Object> fullcalendaradd(@RequestBody FullCalendarDto fullcalendarDto) throws Exception{
			Map<Object,Object>map = new HashMap<Object,Object>();

			biz.insert(fullcalendarDto);
		 
			return map;
		}
		
		@RequestMapping("/loading.do")
		public String loading() {
			return "loading";
		}
		

	}

	

