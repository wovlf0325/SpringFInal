package com.mvc.prectice.gagu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.prectice.gagu.biz.GaguBizImpl;
import com.mvc.prectice.gagu.dto.GaguDto;

@Controller
public class GuguController {
	
	@Autowired
	private GaguBizImpl gagubiz;
	
	@RequestMapping(value="/gaguinsert.do")
	public String insertgagu() {
		return "gagu/gaguinsert";
	}
	
	@RequestMapping(value="/gaguinsertinfo.do")
	public String insertgaguinfo(HttpServletRequest request,Model model, GaguDto gagudto) {
		
		String[] gagu = request.getParameterValues("gagu");
		
		List<GaguDto> gagus = new ArrayList<GaguDto>();
		
		
		for(int i =0; i<gagu.length; i++) {
			String[] tmp= gagu[i].split("/");
			//System.out.println(tmp[0]+" "+tmp[5]+", "+tmp[6]);
			//1.dto에 담자
			GaguDto dto = new GaguDto();
			dto.setRegion(tmp[0]);
			dto.setGender(tmp[1]);
			dto.setAgesum(Integer.parseInt(tmp[2]));
			dto.setMiman_20(Integer.parseInt(tmp[3]));
			dto.setN_20(Integer.parseInt(tmp[4]));
			dto.setN_30(Integer.parseInt(tmp[5]));
			dto.setN_40(Integer.parseInt(tmp[6]));
			dto.setN_50(Integer.parseInt(tmp[7]));
			dto.setN_60(Integer.parseInt(tmp[8]));
			dto.setN_70(Integer.parseInt(tmp[9]));
			dto.setIsang_80(Integer.parseInt(tmp[10]));
			
			//2.dto를 list(bikes)에 담자
			gagus.add(dto);
		}
		
		model.addAttribute("gagus", gagubiz.gaguinsert(gagus));
		
		System.out.println("db저장 성공");
		
		return "gagu/success";
	}

}
