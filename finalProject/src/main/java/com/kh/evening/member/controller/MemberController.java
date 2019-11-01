package com.kh.evening.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.evening.member.model.service.MemberService;

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
	
	@RequestMapping("login.me")
	public String login() {
		return "login";
	}
	
	@RequestMapping("searchidpwd.me")
	public String searchidpwd() {
		return "searchidpwd";
	}
	
	
}
