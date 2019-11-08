package com.kh.evening.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.member.model.service.MemberService;
import com.kh.evening.member.model.vo.Member;

@Controller
public class ChatController {


	@RequestMapping("/chat.ch")
	public ModelAndView chat(HttpServletRequest request,ModelAndView mv) {
		System.out.println("=================ModelAndView===============");
		
		HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");


		
		//사용자 정보 출력(세션)//
/*		Member user = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
*/		
		
		System.out.println("loginUser      :"+loginUser);
		System.out.println("loginUser.toString      :"+loginUser.toString());
		mv.addObject("userid", loginUser.getNickName() );
		mv.setViewName("chat/chattingview");
		return mv;
	}
}
