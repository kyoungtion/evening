package com.kh.evening.chat.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.member.model.vo.Member;

@Controller
public class ChatController {

	@RequestMapping("/chat.ch")
	public ModelAndView chat(ModelAndView mv) {
		System.out.println("=================ModelAndView===============");
		System.out.println("=================ModelAndView===============");
		System.out.println("=================ModelAndView===============");
		System.out.println("=================ModelAndView===============");
		System.out.println("=================ModelAndView===============");
		System.out.println("=================ModelAndView===============");
		System.out.println("=================ModelAndView===============");
		
		
		
		//사용자 정보 출력(세션)//
		Member user = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(user.equals(null)||user.equals("null")||user==null) {
			System.out.println("=================Error===============");
			System.out.println("=================Error===============");
			System.out.println("=================Error===============");
			System.out.println("=================Error===============");
			System.out.println("=================Error===============");
			System.out.println("=================Error===============");
			System.out.println("=================Error===============");
		}
		user.setUser_name("asdf");
		System.out.println("user name :" + user.getUser_name());
				
		System.out.println("normal chat page");
		
		mv.addObject("userid", user.getUser_name());
		System.out.println("mv"+mv);
		System.out.println("mv.getViewName()"+mv.getViewName());
		return mv;
	}
}
