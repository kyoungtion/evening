package com.kh.evening.gesipan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.evening.gesipan.model.service.GesipanService;

@Controller
public class GesipanController {
	
	@Autowired
	private GesipanService gService;
	
	@RequestMapping("community.ge")
	public String communityBoard() {
		return "community";
	}
	
	@RequestMapping("selling.ge")
	public String sellingBoard() {
		return "selling";
	}
	
	@RequestMapping("qna.ge")
	public String qnaBoard() {
		return "qna";
	}
	
	@RequestMapping("qnaInsertView.ge")
	public String qnaInsertView() {
		return "qnaInsertView";
	}
}
