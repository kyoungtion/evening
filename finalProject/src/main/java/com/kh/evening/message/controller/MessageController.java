package com.kh.evening.message.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.message.exception.MessageException;
import com.kh.evening.message.model.service.MessageService;
import com.kh.evening.message.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("message.sr")
	public ModelAndView rList()  {
		ArrayList<Message> list = messageService.receiveList();
		ModelAndView message = new ModelAndView();
		message.setViewName("List");
		message.addObject("list",list);
		return message;
		
	}

}
