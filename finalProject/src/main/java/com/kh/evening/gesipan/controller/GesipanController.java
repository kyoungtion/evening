package com.kh.evening.gesipan.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	
	@RequestMapping("gesipanInsertView.ge")
	public String qnaInsertView(@RequestParam("g_category") String category, Model model) {
		model.addAttribute("category", category);
		return "gesipanInsertView";
	}
	
	@RequestMapping("gInsert.ge")
	public String gInsert(@ModelAttribute Gesipan g, HttpServletRequest request) {
		String url = "redirect:gList.ge?category=";
		if(g.getG_category().equals("Community")) {
			url += "Community";
		} else if(g.getG_category().equals("Selling")) {
			url += "Selling";
		} else if(g.getG_category().equals("QNA")) {
			url += "QNA";
		}
		
		int result = gService.insertGesipan(g);
		if(result > 0) {
			return url;
		} else {
			throw new GesipanException("게시글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("gList.ge")
	public ModelAndView gList(@RequestParam(value="page", required=false) Integer page, 
								@RequestParam("category") String category,
								ModelAndView mv) {
		System.out.println("page : " + page);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = gService.getListCount(category);
		PageInfo pi = null;
		if(!category.equals("QNA")) {
			pi = Pageination.getGesipanPageInfo(currentPage, listCount);
		} else if(category.equals("QNA")) {
			pi = Pageination.getQnaPageInfo(currentPage, listCount);
		}
		
		System.out.println(pi);
		System.out.println(pi.getStartPage());
		
		ArrayList<Gesipan> list = gService.selectGesipanList(pi, category);
		String cate = "";
		if(category.equals("Community")) {
			cate = "community";
		} else if(category.equals("Selling")) {
			cate = "selling";
		} else if(category.equals("QNA")) {
			cate = "qna";
		}
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName(cate);
		} else {
			throw new GesipanException("게시글 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("gesipanSearch.ge")
	public ModelAndView gSearch(@RequestParam(value="page", required=false) Integer page,
							@RequestParam("searchfor") String searchfor, 
							@RequestParam("keyword") String keyword,
							@RequestParam("category") String category,
							ModelAndView mv) throws UnsupportedEncodingException {
		
		Map<String, String> parameters = new HashMap<>();
		parameters.put("searchfor", URLDecoder.decode(searchfor,"UTF-8"));
		parameters.put("keyword", URLDecoder.decode(keyword,"UTF-8"));
		parameters.put("category", URLDecoder.decode(category,"UTF-8"));
		
		if(!category.equals("QNA")) {
				
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = gService.getSearchListCount(category, parameters);
			PageInfo pi = Pageination.getGesipanPageInfo(currentPage, listCount);
			System.out.println(pi);
			
			ArrayList<Gesipan> list = gService.selectSearchList(pi, parameters);
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName(category.toLowerCase());
			} else {
				throw new GesipanException("게시글 전체 조회에 실패하였습니다.");
			}
		} else {
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = gService.getSearchListCount(category, parameters);
			PageInfo pi = Pageination.getQnaPageInfo(currentPage, listCount);
			System.out.println(pi);
			
			ArrayList<Gesipan> list = gService.selectSearchList(pi, parameters);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName(category.toLowerCase());
			} else {
				throw new GesipanException("게시글 전체 조회에 실패하였습니다.");
			}
		}
		
		return mv;
	}
	
	/*@RequestMapping("community.ge")
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
	}*/
	
	
	
	
	
}
