package com.kh.evening.payment.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.board.model.service.BoardService;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.common.Pageination;
import com.kh.evening.member.model.vo.Member;
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
	// 결제 목록
	@RequestMapping("pList.py")
	public ModelAndView pList(Model model, HttpServletRequest request, @RequestParam(value="page", required=false) Integer page,
						ModelAndView mv)	{
		/*Member m = (Member)model.getAttribute("loginUser");*/
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = pService.getListCount();
		PageInfo pi = Pageination.getPayPageInfo(currentPage, listCount);
		
		ArrayList<Payment> list = pService.selectPaymentList(pi);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			if(m.getUser_id().equals("admin")) {
				mv.setViewName("adminPaylist");
			} else {
				mv.setViewName("paylist");
			}
		}else {
			throw new PaymentException("결제 내역 조회에 실패하였습니다.");
		}
		
		return mv;
		
		
	}
	
	// 결제 내역 검색
	@RequestMapping("paylistSearch.py")
	public ModelAndView pSearch(@RequestParam(value="page", required=false) Integer page,
							@RequestParam("searchfor") String searchfor,
							@RequestParam("keyword") String keyword,
							ModelAndView mv) throws UnsupportedEncodingException{
		
		Map<String, String> parameters = new HashMap<>();
		parameters.put("searchfor", URLDecoder.decode(searchfor, "UTF-8"));
		parameters.put("keyword", URLDecoder.decode(keyword, "UTF-8"));
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = pService.getSearchListCount(parameters);
		PageInfo pi = Pageination.getPayPageInfo(currentPage, listCount);
		
		ArrayList<Payment> list = pService.selectSearchList(pi, parameters);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("paylist");
			System.out.println("list : " + list);
			System.out.println("pi : " + pi);
		}else {
			throw new PaymentException("결제 내역 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
/*	// 결제 취소 요청
	@RequestMapping("pdelete.py")
	public String deletePayment(@ModelAttribute Payment p, SessionStatus status,
								@RequestParam("ids") String ids) {
		String[] idArray = ids.split(",")
		int result = pService.deletePayment(p);
		
		if(result > 0) {
			status.setComplete();
			return "redirect:home.do";
		}else {
			throw new PaymentException("결제 취소 요청을 실패하였습니다.");
		}
	}*/
/*	@ResponseBody
	@RequestMapping(value="/deletePayment", method=RequestMethod.POST)
	public int deletePayment(HttpSession session, 
					@RequestParam(value="chk[]") List<String> chArr, PayVO pa)


	}*/
	// 결제 취소 요청
   @RequestMapping("pdelete.py")
   public String deletePayment(@RequestParam("ids") String ids) {
      String[] idArray = ids.split(",");
      System.out.println("ids : " + ids);
      int result = pService.deletePayment(idArray);
      System.out.println("idArray : " + idArray);
      
      if(result > 0) {
         return "redirect:pList.py";
      }else {
         throw new PaymentException("결제 취소 요청을 실패하였습니다.");
      }
   }
   
	  @RequestMapping("deleteAuc.py")
	   public String deleteAuc(@RequestParam("sgId") int sgId, @RequestParam("aId") int aId,
			   @RequestParam(value="price", required=false) Integer price) {	  
		  
		  AuctionHistory au = new AuctionHistory();
		  au.setSg_Id(sgId);
		  au.setA_Id(aId);
		  au.setA_Price(price);
		  
		  int result = pService.deleteAuction(au);
		  System.out.println("sgId :" + sgId);
		  System.out.println("aId : " + aId);
		  
		  if(result > 0) {
			  int maxPrice = pService.auctionMaxPrice(sgId);
			  
			  if(maxPrice < 1) {
				  throw new PaymentException(sgId + "의 입찰 취소가 실패하였습니다.");
			  }
				  
		  }else {
			  throw new PaymentException("취소 실패");
		  }
		  
		  return "redirect:dealDetail.me";
	   }
 
   
	
 
}
