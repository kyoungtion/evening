package com.kh.evening.gesipan.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
		
		int listCount = gService.getCListCount();
		PageInfo pi = Pageination.getGesipanPageInfo(currentPage, listCount);
		System.out.println(pi);
		
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
	public ModelAndView sellingBoard(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getSListCount();
		PageInfo pi = Pageination.getGesipanPageInfo(currentPage, listCount);
		System.out.println(pi);
		
		ArrayList<Gesipan> list = gService.selectSellingList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("selling");
		} else {
			throw new GesipanException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("qna.ge")
	public ModelAndView qnaBoard(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getQListCount();
		PageInfo pi = Pageination.getQnaPageInfo(currentPage, listCount);
		System.out.println(pi);
		
		ArrayList<Gesipan> list = gService.selectQnaList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("qna");
		} else {
			throw new GesipanException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("gesipanInsertView.ge")
	public String qnaInsertView(@RequestParam("g_category") String category, Model model) {
		model.addAttribute("category", category);
		return "gesipanInsertView";
	}
	
	@RequestMapping("gInsert.ge")
	public String gInsert(@ModelAttribute Gesipan g, HttpServletRequest request) {
		String url = "redirect:";
		if(g.getG_category().equals("Community")) {
			url += "community.ge";
		} else if(g.getG_category().equals("Selling")) {
			url += "selling.ge";
		} else if(g.getG_category().equals("QNA")) {
			url += "qna.ge";
		}
		
		int result = gService.insertGesipan(g);
		if(result > 0) {
			return url;
		} else {
			throw new GesipanException("게시글 등록에 실패하였습니다.");
		}
	}
}
