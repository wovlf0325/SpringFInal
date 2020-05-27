package com.mvc.prectice.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mvc.prectice.login.biz.KakaoLoginBO;
import com.mvc.prectice.login.biz.LoginBiz;
import com.mvc.prectice.login.biz.NaverLoginBO;
import com.mvc.prectice.login.dto.LoginDto;

@Controller
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	/*kakaoLoginBO */
	private KakaoLoginBO kakaoLoginBO;
	
	@Autowired
	private void setKakaoLoginBo(KakaoLoginBO kakaoLoginBO) {
		this.kakaoLoginBO = kakaoLoginBO;
	}
	

	@Autowired
	private LoginBiz loginbiz;

	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String Login(Model model, HttpSession session) {
		logger.info("login");
		
		return "login";
	}

	@RequestMapping(value = "/logout.do")
	public String Logout(Model model, HttpServletRequest request) {
		logger.info("Logout");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:index.jsp";
	}
	
	
	   @RequestMapping(value = "/loginRes.do",method = RequestMethod.POST)
	   public String LoginRes(LoginDto logindto, HttpServletRequest request) {
	      LoginDto dto = new LoginDto();
	      dto = loginbiz.selectInfo(logindto);
	      if (dto == null || dto.getId() == null) return "redirect:login.do";
	         System.out.println(dto.getId());
	         System.out.println(dto.getMember_pw());
	      if (logindto.getId().equals(dto.getId())) {
	         dto = loginbiz.selectInfo(logindto); 
	         System.out.println(dto.getId());
	      if(dto != null) {
	         HttpSession session = request.getSession();
	         System.out.println("정상 - " + dto.getId());
	         session.setAttribute("logininfo", dto);
	         return "section";
	         }
	      }
	      System.out.println("로그인 실패");
	      return "redirect:login.do";
	   }
	
	
	@RequestMapping("/updateform.do")
	public String updateform(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginDto dto = (LoginDto) session.getAttribute("logininfo");
		if (dto == null) return "redirect:login.do";
		System.out.println("test");
		return "updateform";
	}
	
	// 내 정보
	@RequestMapping(value = "/getLoginInfo",method = RequestMethod.GET)
	@ResponseBody
	public LoginDto getLastLetterSeq(HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		LoginDto dto = (LoginDto) session.getAttribute("logininfo");
		return loginbiz.selectInfoWhereId(dto);
	}
	@RequestMapping(value = "/updateMember",method = RequestMethod.POST)
	public String updateMember(


			@RequestParam("member_id")String member_id, 
			@RequestParam("member_pw")String member_pw,
			@RequestParam("member_name")String member_name,
			@RequestParam("member_email")String member_email,
			@RequestParam("member_phone")String member_phone,
			@RequestParam("member_address")String member_address,
			@RequestParam("member_interest")String member_interest,
			@RequestParam("member_area")String member_area,
			@RequestParam("member_role")String member_role,
			@RequestParam("member_status")String member_status) {
		loginbiz.updateMypage(new LoginDto(member_id, member_pw, member_name, member_phone, member_email, member_address, member_role, member_area, member_interest, member_status));
		return "redirect:updateform.do";
	}
	
	
// 카카오 로그인 
	
	@RequestMapping(value="/kakaoLogin.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String KakaoLogin(HttpSession session) {
		
		String kakaoUrl = kakaoLoginBO.getAuthorizationUrl(session);
		System.out.println("카카오:" + kakaoUrl);
		
		return "redirect:"+kakaoUrl.toString();
	}
	
	@RequestMapping(value="/kakaoLoginRes.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String KaKaoLoginRes(Model model, @RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response) {
		// 로그인 후에 code get
System.out.println(code);
		
		JsonNode node = KakaoLoginBO.getAccessToken(code);
		JsonNode accessToken = node.get("access_token");
		JsonNode userInfo = KakaoLoginBO.getKakaoUserInfo(accessToken);
		
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
				
		// 카카오에서 유저정보 가져오기 
		 String id = userInfo.get("id").toString();
		 //System.out.println(id);
		 String email = kakao_account.get("email").toString();
		 //System.out.println(email);
		 //String image = userInfo.get("properties").get("profile_image").toString();
		 String name = userInfo.get("properties").get("nickname").toString();
		 //System.out.println(name);

      
		model.addAttribute("id", id);
		model.addAttribute("email", email);
		model.addAttribute("name", name);
		
		return "kakaologin";
		
	}
	

//네이버 로그인
	
	@RequestMapping(value="/naverLogin.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String naverLogin(HttpSession session) {
		String naverUrl = naverLoginBO.getAuthorizationUrl(session);
		return "redirect:"+naverUrl.toString();
	}


	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverLoginRes.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		// 로그인 사용자 정보를 읽어온다.
        //System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        //System.out.println("result"+apiResult);
		
		/* 네이버 로그인 성공 페이지 View 호출 */
		return "naverlogin";
	}

}
