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
		ArrayList<Message> list = messageService.receiveList(loginUser.getUser_id());
		ArrayList<Message> slist = messageService.sendList(loginUser.getUser_id());
		
		mv.setViewName("message");
		mv.addObject("rlist",list);
		mv.addObject("slist",slist);
		return mv;
		
	}
	
}
