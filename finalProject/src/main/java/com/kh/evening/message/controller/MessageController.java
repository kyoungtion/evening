package com.kh.evening.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.member.model.service.MemberService;
import com.kh.evening.member.model.vo.Member;
import com.kh.evening.message.model.service.MessageService;
import com.kh.evening.message.model.vo.Message;

@SessionAttributes("loginUser")
@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;

	@Autowired
	private MemberService mService;
	
	@RequestMapping("message.sr")
	public ModelAndView rList(Model model, 	@ModelAttribute Member m,ModelAndView mv) {
		Member loginUser = (Member) model.getAttribute("loginUser");
		Member loginUser1 = mService.memberLogin(m);
		ArrayList<Message> rlist = messageService.receiveList(loginUser.getUser_id());
		ArrayList<Message> slist = messageService.sendList(loginUser.getUser_id());
		loginUser.setCount(messageService.getCount(loginUser.getUser_id()));
		
		model.addAttribute("loginUser", loginUser1);
		mv.setViewName("message");
		mv.addObject("rlist", rlist);
		mv.addObject("slist", slist);
		
		return mv;

	}

	@RequestMapping("write.sr")
	public String write() {
		System.out.println("글쓰기 function");
		return "write";
	}

	@RequestMapping("insertMessage.sr")
	public ModelAndView insert(HttpServletRequest req, Model model) {
		Member loginUser = (Member) model.getAttribute("loginUser");
		Map param = new HashMap();
		param.put("loginUser", loginUser.getUser_id());
		param.put("username", req.getParameter("username"));
		param.put("title", req.getParameter("title"));
		param.put("subject", req.getParameter("subject"));
		messageService.insertMessage(param);
		return null;
	}
	@RequestMapping("rDetail.sr")
	public ModelAndView rmessageDetail(Model model, ModelAndView mv,HttpServletRequest req) {
		Member loginUser = (Member) model.getAttribute("loginUser");
		Map rparam=new HashMap();
		rparam.put("m_NO", Integer.parseInt(req.getParameter("m_NO")) );
		rparam.put("loginUser", loginUser.getUser_id());
		List<Map<String,Object>> rlist = messageService.rmessageDetail(rparam);
		int updateCheck = messageService.checkUpdate(rparam);
		System.out.println("rlist     :"+rlist);
		System.out.println("rlist.toString()     :"+rlist.toString());
		System.out.println("updateCheck  :" + updateCheck);
		mv.addObject("rlist", rlist);
		mv.setViewName("rDetail");
		return mv;
		
	}
	@RequestMapping("sDetail.sr")
	public ModelAndView smessageDetail(Model model, ModelAndView mv,HttpServletRequest req) {
		Member loginUser = (Member) model.getAttribute("loginUser");
		Map sparam=new HashMap();
		sparam.put("m_NO", Integer.parseInt(req.getParameter("m_NO")) );
		sparam.put("loginUser", loginUser.getUser_id());
		List<Map<String,Object>> slist = messageService.smessageDetail(sparam);
//		int updateCheck = messageService.checkUpdate(sparam);
		System.out.println("slist     :"+slist);
		System.out.println("slist.toString()     :"+slist.toString());
//		System.out.println("updateCheck  :" + updateCheck);
		mv.addObject("slist", slist);
		mv.setViewName("sDetail");
		return mv;
		
	}
	
	@RequestMapping("delete.sr")
	public String delete(@RequestParam("delete") String[] delete, ModelMap modelMap) {
		for(String seq : delete) {
			System.out.println("delete :"+delete);
			System.out.println("delete.toString() :"+delete.toString());
			
			System.out.println(seq);
			System.out.println(seq.toString());
			int deleteRow = messageService.deleteRow(seq);
		}
		return "redirect:message.sr";
		
	}
	
	
	
}