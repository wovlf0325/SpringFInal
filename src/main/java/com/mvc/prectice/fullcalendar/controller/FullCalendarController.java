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

       logger.info("SELECT LIST");   
       model.addAttribute("fullcalendarDto",biz.selectList());
      return "fullcalendar/fullcalendar";
   }
   
   @RequestMapping(value = "/planList.do")
   @ResponseBody
   public void planList(HttpSession sesion, HttpServletResponse response) throws Exception{
      logger.info("planList!!!!!!!!");
        List<FullCalendarDto> list = biz.selectList();
        
        
       Gson gson = new Gson();
       String plan = gson.toJson(list);
       System.out.println("우와 잠깐 들렸다 갑니다"+plan);
       PrintWriter out = response.getWriter();
       out.print(plan);
   
   }
   
   @RequestMapping(value = "/fullcalendarpopup.do")
   public String FullCalendarPopup() {
   
      logger.info("팝업들어갑니다~");
      
      return "fullcalendar/fullcalendarpopup";
   }
   
   //일정 추가 버튼 클릭 Ajax
      @ResponseBody
      @RequestMapping(value = "/fullcalendaradd.do", method = RequestMethod.POST)
      public Map<Object,Object> fullcalendaradd(@RequestBody FullCalendarDto fullcalendarDto) throws Exception{
         Map<Object,Object>map = new HashMap<Object,Object>();

         biz.insert(fullcalendarDto);
       
         return map;
      }
      
      
      
      @RequestMapping("/fullcalendardetail.do")
      public String FullCalendarDetail(Model model, int plan_no) {
         logger.info("디테일 들어왔다잉");
         System.out.println("fullcalendardetail 컨트롤러!!!!!!!!"+ plan_no);
         
         
         System.out.println(plan_no);
         
         model.addAttribute("fullcalendarDto", biz.selectOne(plan_no));
         
         return "fullcalendar/fullcalendardetail";
      }
      
      
      @RequestMapping(value = "/fullcalendarupdateform.do", method = RequestMethod.GET)
      public String FullCalendarUpdateForm(Model model, int plan_no) {
         
         
         logger.info("updateform controller");  
         FullCalendarDto fullcalendarDto = biz.selectOne(plan_no);
         model.addAttribute("fullcalendarDto",fullcalendarDto);
         System.out.println(plan_no);
         System.out.println(fullcalendarDto);
         return "fullcalendar/fullcalendarupdateform";
      }
      
      @RequestMapping(value = "/fullcalendarupdateres.do")
      public String FullCalendarUpdateRes(FullCalendarDto fullcalendarDto,Model model) {
         
         logger.info("update result");
         int res = biz.update(fullcalendarDto);
         System.out.println(res);
         
         if(res>0) {
            return "redirect:fullcalendardetail.do?plan_no="+ fullcalendarDto.getPlan_no();
         }else {
            logger.info("업덷이트실패");
            return "redirect:fullcalendarupdateform.do?plan_no="+fullcalendarDto.getPlan_no();   
         }
      }
      
      @RequestMapping(value = "/fullcalendardelete.do", method = RequestMethod.GET)
      public String deleteres(Model model, int plan_no) {
         
         logger.info("delete result");
         
         int res = biz.delete(plan_no);
         
         if(res > 0) {
            return "redirect:close.do";
         }else {
            return "redirect:fullcalendardetail.do";
         }
      }
      
      @RequestMapping(value = "/close.do")
      public String close() {
         return "fullcalendar/fullcalendarclose";
      }
      

   }

   
