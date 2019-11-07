package com.kh.evening.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.evening.member.model.exception.MemberException;
import com.kh.evening.member.model.service.MemberService;
import com.kh.evening.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("myinfo.me")
	public String myinfo() {
		return "myinfo";
	}
	
	@RequestMapping("favorites.me")
	public String favorites() {
		return "favorites";
	}
	
	@RequestMapping("dealDetail.me")
	public String dealDetail() {
		return "dealDetail";
	}
	
	@RequestMapping("mypost.me")
	public String mypost() {
		return "mypost";
	}
	
	@RequestMapping("updateAucView.me")
	public String updateAucView() {
		return "updateAuc";
	}
	
	// 로그인용 컨트롤러
	@RequestMapping("login.me")
	public String login() {
		return "login";
	}
	
	// 아이디 비밀번호 찾기 컨트롤러
	@RequestMapping("searchidpwd.me")
	public String searchidpwd() {
		return "searchidpwd";
	}
	
	// 회원가입용 컨트롤러
	
	
	@RequestMapping("ebinsert.me")
	public String insertMember(@ModelAttribute Member m,
						   @RequestParam("zipcode1") String zipcode1,
						   @RequestParam("addr") String addr,
						   @RequestParam("addrDtl")String addrDtl) {
		
	m.setAddress(  zipcode1 + "/" + addr + "/" +addrDtl);
	
	// 비밀번호 암호화
	
	String encPwd = bcryptPasswordEncoder.encode(m.getUser_pwd());
	m.setUser_pwd(encPwd);
	
	System.out.println(m);
	
	int result = mService.insertMember(m);
	
	if(result > 0) {
		return "index.jsp";
	}else {
		throw new MemberException("회원가입에 실패하였습니다.");
	}
		
		
		
	}
	
	// 암호화 후 로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String memberLogin(Member m ,Model model) {
		
		Member loginUser = mService.memberLogin(m);
		
		if(bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {
			model.addAttribute("loginUser",loginUser);
			
		}else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
		return "index.jsp";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
