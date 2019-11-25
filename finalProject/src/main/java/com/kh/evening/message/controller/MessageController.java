package com.kh.evening.message.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.member.model.vo.Member;
import com.kh.evening.message.model.service.MessageService;
import com.kh.evening.message.model.vo.Message;

@SessionAttributes("loginUser")
@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("message.sr")
	public ModelAndView rList(Model model, 
				ModelAndView mv)  {
		Member loginUser = (Member)model.getAttribute("loginUser");
		ArrayList<Message> rlist = messageService.receiveList(loginUser.getUser_id());
		ArrayList<Message> slist = messageService.sendList(loginUser.getUser_id());
		System.out.println("rlist.toString	 :"+rlist.toString());
		System.out.println("slist.toString	 :"+slist.toString());
		System.out.println("rlist.size()	 :"+rlist.size());
		System.out.println("slist.size()	 :"+slist.size());
		int rlistCount = rlist.size();
		int slistCount = slist.size();
		mv.setViewName("message");
		mv.addObject("rlist",rlist);
		mv.addObject("slist",slist);
		mv.addObject("rlistCount",rlistCount);
		mv.addObject("slistCount",slistCount);
		return mv;
		
	}
	
	@RequestMapping("write.sr")
	public String write() {
		System.out.println("글쓰기 function");
		return "write";
	}
	
}
