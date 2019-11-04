package com.kh.evening.push.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.evening.member.model.service.MemberService;
import com.kh.evening.push.model.service.PushService;

@SessionAttributes("loginUser")
@Controller
public class PushController {
	
	@Autowired
	private PushService pService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("pushMain.pu")
	public String pushMain() {
		return "pushMain";
	}
	
/*	@RequestMapping("favorites.me")
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
	}*/
}
