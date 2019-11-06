package com.kh.evening.gesipan.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.common.Pageination;
import com.kh.evening.gesipan.exception.GesipanException;
import com.kh.evening.gesipan.model.service.GesipanService;
import com.kh.evening.gesipan.model.vo.Gesipan;

@Controller
public class GesipanController {
	
	@Autowired
	private GesipanService gService;
	
	@RequestMapping("community.ge")
	public ModelAndView communityBoard(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getListCount();
		PageInfo pi = Pageination.getGesipanPageInfo(currentPage, listCount);
		
		ArrayList<Gesipan> list = gService.selectCommunityList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("community");
		} else {
			throw new GesipanException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("selling.ge")
	public String sellingBoard() {
		return "selling";
	}
	
	@RequestMapping("qna.ge")
	public String qnaBoard() {
		return "qna";
	}
	
	@RequestMapping("gesipanInsertView.ge")
	public String qnaInsertView(@RequestParam("g_category") String category, Model model) {
		model.addAttribute("category", category);
		return "gesipanInsertView";
	}
	
	@RequestMapping("gInsert.ge")
	public String gInsert(@ModelAttribute Gesipan g) {
		
		int result = gService.insertGesipan(g);
		
		if(result > 0) {
			return "redirect:home.do";
		} else {
			throw new GesipanException("게시글 등록에 실패하였습니다.");
		}
	}
}
