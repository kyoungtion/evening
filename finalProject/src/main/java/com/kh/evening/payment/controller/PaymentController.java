package com.kh.evening.payment.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.board.model.service.BoardService;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.common.Pageination;
import com.kh.evening.payment.model.exception.PaymentException;
import com.kh.evening.payment.model.service.PaymentService;
import com.kh.evening.payment.model.vo.Payment;


//@SessionAttributes("loginUser")
@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService pService;
	
	@Autowired
	private BoardService bService;
	
	// 배송지 정보 입력 폼
	@RequestMapping("shipInfo.py")
	public String shipInfo(@RequestParam("sgId") int sgId, Model model) {
		Board b = bService.selectOne(sgId);
		model.addAttribute("b",b);
		
		return "shipInfo";
	}
	
	// 배송 정보 입력 -> DB
	@RequestMapping("pinsert.py")
	public String insertPay(@ModelAttribute Payment p,
							//@RequestParam("postcode") String postcode,
							@RequestParam("post") String postcode,
							@RequestParam("addr1") String addr1,
							@RequestParam("addr2") String addr2) {
		
		p.setP_ADDRESS(postcode + "/" + addr1 + "/" + addr2);
		
		System.out.println(p);
		int result = pService.insertPay(p);
		
		if(result > 0) {
			return "redirect:index";
		}else {
			throw new PaymentException("배송지 정보 입력에 실패하셨습니다.");
		}
	}
	
	@RequestMapping("pList.py")
	public ModelAndView pList(@RequestParam(value="page", required=false) Integer page,
						ModelAndView mv)	{
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = pService.getListCount();
		PageInfo pi = Pageination.getPayPageInfo(currentPage, listCount);
		
		ArrayList<Payment> list = pService.selectPaymentList(pi);
		if(list != null) {
			mv.addObject("list", list);
			System.out.println(list);
			mv.addObject("pi", pi);
			System.out.println(pi);
			mv.setViewName("paylist");
			System.out.println(mv);
		}else {
			throw new PaymentException("결제 내역 조회에 실패하였습니다.");
		}
		
		return mv;
		
		
	}
	
}
