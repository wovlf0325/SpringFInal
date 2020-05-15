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
		System.out.println("ok");
		LoginDto dto = new LoginDto();

		dto = loginbiz.selectInfo(logindto); 
		System.out.println(dto.getId());
		if(dto != null) {
			HttpSession session = request.getSession();
			System.out.println("정상 - " + dto.getId());
			session.setAttribute("logininfo", dto);
			return "section";

		}else {

			System.out.println("로그인 실패");
			return "redirect:login.do";
		}
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
		// 임의적으로 아이디: admin 값 받는지 확인
		LoginDto dto = new LoginDto();
		dto.setId("admin");
		dto = loginbiz.selectInfoWhereId(dto);
		
		//로그인 문제가 해결되면 위 3줄 제거후 아래 주석 해제하자
//		HttpSession session = request.getSession();
//		dto = loginbiz.selectInfoWhereId((LoginDto) session.getAttribute("logininfo"));

		return dto;
	}
	@RequestMapping(value = "/updateMember",method = RequestMethod.POST)
	public String updateMember(


			@RequestParam("id")String id, 
			@RequestParam("pw")String pw,
			@RequestParam("name")String name,
			@RequestParam("email")String email,
			@RequestParam("phone")String phone,
			@RequestParam("address")String address,
			@RequestParam("interest")String interest,
			@RequestParam("area")String area,
			@RequestParam("role")String role,
			@RequestParam("status")String status) {
		loginbiz.updateMypage(new LoginDto(id, pw, name, phone, email, address, role, area, interest, status));
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
		apiResult = userInfo.toString();
		System.out.println(userInfo);
		
		// 카카오에서 유저정보 가져오기 
 		String id = userInfo.path("id").asText();
 		String nickname = null;
 		String email = null;
 		String thumbnailImage = null;
 		String profileImage = null;

        // 유저정보 카톡에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		System.out.println(properties);
		

		if (properties.isMissingNode()) {
			// if "name" node is missing
		} else {
			nickname = properties.path("nickname").asText();
			thumbnailImage = properties.path("thumbnail_image").asText();
			profileImage = properties.path("profile_image").asText();
			//System.out.println("nickname : " + nickname);
			//System.out.println("thumbnailImage : " + thumbnailImage);
			//System.out.println("profileImage : " + profileImage);
		}
		model.addAttribute("result", apiResult);
		System.out.println(apiResult);
		
		return "testview";
		
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
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
		
		/* 네이버 로그인 성공 페이지 View 호출 */
		return "testview";
	}

}
