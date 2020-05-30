package com.mvc.prectice.house.controller;



import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.house.biz.HouseBiz;
import com.mvc.prectice.house.dto.HouseDto;
import com.mvc.prectice.login.dto.LoginDto;

@Controller
public class HouseController {

	@Autowired
	private HouseBiz housebiz;
	
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@RequestMapping(value="/houselist.do")
	public String selectList(HouseDto housedto, Model model) {
		
		logger.info("SELECT LIST");
		
		model.addAttribute("houselist", housebiz.selectList());
		
		return "house/houselist";
	}
	
	
	@RequestMapping(value="/houseinsert.do")
	public String insert(Model model) {
		
		logger.info("INSERT");
		
		return "house/houseinsert";
		
	}
	
	@RequestMapping(value="/houseinsertres.do", method=RequestMethod.POST)
	public String insertres(Model model, @RequestParam("house_keeper")int house_keeper, 
			@RequestParam("house_name")String house_name, @RequestParam("house_phone")String house_phone, @RequestParam("house_addr")String house_addr, 
			@RequestPart("file")MultipartFile file, @RequestParam("house_content")String house_content, @RequestParam("house_document")String house_document, @RequestParam("house_status")String house_status) {
		
		logger.info("INSERTLES");
		
		int res = 0;
		
		HouseDto housedto = new HouseDto();
		
		String savePath = "C:\\Git_Coliving\\src\\main\\webapp\\resources\\images\\houseimgstorage";
		String fullPath = "";
		String rename = "";
		
		 if(file.getSize() == 0) {
				rename = "defaulthouse.jpg";
				
			 }else {
				String originalFilename = file.getOriginalFilename(); // ???.jpg
			    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
			    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
			     
			    rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
			    fullPath = savePath + "\\" + rename;
			    System.out.println(fullPath);
			}
		 
		 if(!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
					stream.write(bytes);
					stream.close();
					
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		 
		 
		 housedto.setHouse_keeper(house_keeper);
		 housedto.setHouse_name(house_name);
		 housedto.setHouse_phone(house_phone);
		 housedto.setHouse_addr(house_addr);
		 housedto.setHouse_image(rename);
		 housedto.setHouse_content(house_content);
		 housedto.setHouse_document(house_document);
		 housedto.setHouse_status(house_status);
		 
		 
//		 System.out.println(rename);
		 
		 try {
			res = housebiz.insert(housedto);
		} catch (Exception e) {
			System.out.println("insert error");
			e.printStackTrace();
		}
		 System.out.println(res);
		 return "redirect:houselist.do";
	}

	private String getCurrentDayTime() {
		long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	@RequestMapping(value="/housedetail.do")
	public String selectOne(Model model, int house_id,HttpSession session, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		logger.info("SELECT ONE");
		
		HouseDto housedto = housebiz.selectOne(house_id);
		
		LoginDto logindto = (LoginDto) session.getAttribute("logininfo");
		String id = URLEncoder.encode(logindto.getMember_id(), "UTF-8");

		String image = URLEncoder.encode(housedto.getHouse_image(),"UTF-8");
		String name = URLEncoder.encode(housedto.getHouse_name(), "UTF-8");
		String url = URLEncoder.encode("housedetail.do?house_id=" + housedto.getHouse_id(), "UTF-8");
		

		Cookie image_ = new Cookie("house_image"+housedto.getHouse_id() + id, image);
		Cookie name_ = new Cookie("house_name" + housedto.getHouse_id() + id, name);
		Cookie url_ = new Cookie("house_url" + housedto.getHouse_id() + id, url);
		

		image_.setMaxAge(60 * 1);
		name_.setMaxAge(60 * 1);
		url_.setMaxAge(60 * 1);
		

		response.addCookie(image_);
		response.addCookie(name_);
		response.addCookie(url_);
		
		
		model.addAttribute("housedto", housedto);
		
		return "house/housedetail";
	}
	
	@RequestMapping(value="/housedelete.do")
	public String delete(Model model, int house_id) {
		
		logger.info("DELETE");
		
		model.addAttribute("housedto", housebiz.delete(house_id));
		
		return "redirect:houselist.do";
	}
	
	@RequestMapping(value="/houseupdateform.do")
	public String updateForm(Model model, int house_id) {
		logger.info("UPDATE FORM");
		
		HouseDto housedto = housebiz.selectOne(house_id);
		model.addAttribute("housedto", housedto);
		
		return "house/houseupdate";
		
	}
	
	@RequestMapping(value="/houseupdateres.do", method = RequestMethod.POST)
	public String updateRes(Model model, @RequestParam("house_id")int house_id, @RequestParam("house_name")String house_name, @RequestParam("house_phone")String house_phone, @RequestParam("house_addr")String house_addr, 
			@RequestPart("file")MultipartFile file, @RequestParam("house_content")String house_content, @RequestParam("house_document")String house_document, @RequestParam("house_status")String house_status) {
		
		logger.info("UPDATE RESULT");
		
		
		HouseDto housedto = new HouseDto();
		
		String savePath = "C:\\Git_Coliving\\src\\main\\webapp\\resources\\images\\houseimgstorage";
		String fullPath = "";
		String rename = "";
		
		 if(file.getSize() == 0) {
				rename = "defaulthouse.jpg";
				
			 }else {
				String originalFilename = file.getOriginalFilename(); // ???.jpg
			    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
			    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
			     
			    rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
			    fullPath = savePath + "\\" + rename;
			}
		 
		 if(!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
					stream.write(bytes);
					stream.close();
					
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		 
		 housedto.setHouse_id(house_id);
		 housedto.setHouse_name(house_name);
		 housedto.setHouse_phone(house_phone);
		 housedto.setHouse_addr(house_addr);
		 housedto.setHouse_image(rename);
		 housedto.setHouse_content(house_content);
		 housedto.setHouse_document(house_document);
		 housedto.setHouse_status(house_status);
		 
		
			int res = housebiz.update(housedto);
			
			if (res>0) {
				System.out.println("update 성공");
				return "redirect:housedetail.do?house_id=" + housedto.getHouse_id();
				
			} else {
				System.out.println("update 실패");
				return "redirect:houseupdateform.do?house_id" + housedto.getHouse_id();
			}
		} 
		 
		
}
	
	
	
	
	

	

