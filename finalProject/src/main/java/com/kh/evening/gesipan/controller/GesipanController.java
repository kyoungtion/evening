package com.kh.evening.gesipan.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.common.Pageination;
import com.kh.evening.gesipan.exception.GesipanException;
import com.kh.evening.gesipan.model.service.GesipanService;
import com.kh.evening.gesipan.model.vo.Gesipan;
import com.kh.evening.gesipan.model.vo.GesipanReply;

@Controller
public class GesipanController {
	
	@Autowired
	private GesipanService gService;
	
	@RequestMapping("gesipanInsertView.ge")
	public ModelAndView InsertView(@RequestParam("g_category") String category, ModelAndView mv) {
		mv.addObject("category", category);
		mv.setViewName("gesipanInsertView");
		return mv;
	}
	
	@RequestMapping("gesipanReInsertView.ge")
	public ModelAndView reInsertView(@RequestParam("g_category") String category, @RequestParam("g_id") int g_id, ModelAndView mv) {
		mv.addObject("category", category);
		mv.addObject("g", gService.selectGesipan(g_id));
		mv.setViewName("gesipanReInsertView");
		return mv;
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
	
	@RequestMapping("reInsert.ge")
	public String reInsert(@ModelAttribute Gesipan g) {
		System.out.println(g.getG_ref());
		String url = "redirect:gList.ge?category=";
		if(g.getG_category().equals("Community")) {
			url += "Community";
		} else if(g.getG_category().equals("Selling")) {
			url += "Selling";
		} else if(g.getG_category().equals("QNA")) {
			url += "QNA";
		}
		
		int result = gService.reGesipan(g);
		if(result > 0) {
			return url;
		} else {
			throw new GesipanException("답글 등록에 실패했습니다.");
		}
		
	}
	
	
	@RequestMapping("gList.ge")
	public ModelAndView gList(@RequestParam(value="page", required=false) Integer page, 
								@RequestParam("category") String category,
								ModelAndView mv) {
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
							ModelAndView mv,
							HttpServletRequest request) throws UnsupportedEncodingException {
		
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
	
	@RequestMapping("gDetail.ge")
	public ModelAndView gesipanDetail(ModelAndView mv,
									@RequestParam("g_id") int g_id,
									@RequestParam("page") int page) {
		Gesipan g = gService.selectGesipan(g_id);
		
		if(g != null) {
			mv.addObject("g", g).addObject("page", page).setViewName("gesipanDetail");
		} else {
			throw new GesipanException("게시글 상세정보 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("rList.ge")
	public void getReplyList(HttpServletResponse response, Integer g_ref) throws JsonIOException, IOException {
		if(g_ref != null) {
			ArrayList<GesipanReply> list = gService.selectReplyList(g_ref);
			
			for(GesipanReply r : list) {
				r.setNickname(URLEncoder.encode(r.getNickname(),"UTF-8"));
				r.setReply_content(URLEncoder.encode(r.getReply_content(),"UTF-8"));
			}
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(list, response.getWriter());
		}
	}
	
	@RequestMapping("addReply.ge")
	@ResponseBody
	public String insertReply(GesipanReply r, @RequestParam("user_id") String user_id, @RequestParam("nickname") String nickname /*, HttpSession session*/) {
		
		r.setUser_id(user_id);
		r.setNickname(nickname);
		
		int result = gService.insertReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new GesipanException("댓글 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("rCount.ge")
	public void getReplyCount(@RequestParam(value="g_ref", required=false) ArrayList g_ref, HttpServletResponse response) throws JsonIOException, IOException {
		if(g_ref != null) {
				
			// 받아온 리스트(인트변환)
			ArrayList<Integer> list = new ArrayList<>();
			for(int i = 0; i < g_ref.size(); i++) {
				
				String temp = ((String)g_ref.get(i));
				/*Integer intTemp = Integer.parseInt(temp);*/
				if(!g_ref.get(i).equals("NaN")) {
					list.add(Integer.parseInt(temp));

				}
			}
			
			Map<Integer, Integer> result = new HashMap<>();
			for(int i = 0; i < list.size(); i++) {
				result.put(list.get(i), gService.getReplyCount(list.get(i)));
			}
			
			Gson gson = new GsonBuilder().create();
			gson.toJson(result, response.getWriter());
		}
	}

	
	@RequestMapping("rUpdate.ge")
	@ResponseBody
	public String rUpdate(@RequestParam("g_reply_id") Integer r_id,
						@RequestParam("r_content") String r_content) {
		Map<String, Object> map = new HashMap<>();
		map.put("r_id", r_id);
		map.put("r_content", r_content);
		
		int result = gService.updateReply(map);
		
		if(result > 0) {
			return "success";
		} else {
			throw new GesipanException("댓글 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("rDelete.ge")
	@ResponseBody
	public String rDelete(@RequestParam("g_reply_id")Integer r_id) {
		int result = gService.deleteReply(r_id);
		
		if(result > 0) {
			return "success";
		} else {
			throw new GesipanException("댓글 삭제에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("gUpdateView.ge")
	public ModelAndView gUpdateView(@RequestParam("g_id") int g_id,
									@RequestParam("page") int page,
									ModelAndView mv) {
		Gesipan g = gService.selectGesipan(g_id);
		
		if(g != null) {
			mv.addObject("g", g).addObject("page", page).addObject("g_id", g_id).setViewName("gesipanUpdateForm");
		} else {
			throw new GesipanException("수정화면 접근에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("gUpdate.ge")
	public ModelAndView gesipanUpdate(@ModelAttribute Gesipan g, @RequestParam("page") int page, @RequestParam("g_id") int g_id,
								ModelAndView mv) {	
		
		System.out.println(g.getG_content());
		System.out.println(g.getG_title());
		System.out.println(g.getLocked());
		g.setG_id(g_id);
		
		System.out.println("잠금???" + g.getLocked());
		int result = gService.updateGesipan(g);
		g = gService.selectGesipan(g_id);
		
		if(result > 0) {
			mv.addObject("g_id", g_id).addObject("page", page).setViewName("redirect:gDetail.ge");
		} else {
			throw new GesipanException("게시글 수정에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("gDelete.ge")
	public ModelAndView gesipanDelete(@RequestParam("category") String category, @RequestParam("g_id") int g_id, ModelAndView mv) {
		
		int result = gService.deleteGesipan(g_id);
		
		if(result > 0) {
			mv.addObject("category", category).setViewName("redirect:gList.ge");
		} else {
			throw new GesipanException("게시판 삭제에 실패했습니다.");
		}
		
		return mv;
	}
	
}
