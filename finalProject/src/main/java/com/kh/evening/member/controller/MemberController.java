package com.kh.evening.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

//import org.apache.catalina.Manager;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.common.Pageination;
import com.kh.evening.gesipan.model.vo.Gesipan;
//import com.kh.evening.member.email.EmailSender;
import com.kh.evening.member.model.exception.MemberException;
import com.kh.evening.member.model.service.MemberService;
import com.kh.evening.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
   
   @Autowired
   private MemberService mService;
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   // 이메일 보내기 Autowired
   /*@Autowired
   private EmailSender emailSender;*/
   
//   @Autowired
//   private Email email;
   
   /*@Autowired
   JavaMailSender mailSender;*/
   
   
   
   // ****************************************이경희 작업부분
   
   @RequestMapping("myinfo.me")
   public String myinfo() {
      return "myinfo";
   }
   
   @RequestMapping("favorites.me")
   public String favorites() {
      return "favorites";
   }
   
   @RequestMapping("dealDetail.me")
   public String dealDetail() {
      return "dealDetail";
   }
   
   @RequestMapping("mypost.me")
   public ModelAndView mypost(Model model, 
		   					ModelAndView mv, 
		   					@RequestParam(value="category", required=false) String category,
		   					@RequestParam(value="page", required=false) Integer page) {

	   Member loginUser = (Member)model.getAttribute("loginUser");
	   
	   int currentPage = 1;
	   if(page != null) {
		   currentPage = page;
	   }
	   if(category == null) {
		   category = "Community";
	   }

	   Map<String, String> map = new HashMap<>();
	   map.put("category", category);
	   map.put("user_id", loginUser.getUser_id());
	   
	   int listCount = mService.getMyPostListCount(map);
	   
	   PageInfo pi = null;
	   pi = Pageination.getGesipanPageInfo(currentPage, listCount);
	   
	   ArrayList<Gesipan> list = mService.selectMyPost(pi, map);
	   
	   if(list != null) {
		   mv.addObject("list", list);
		   mv.addObject("pi", pi);
		   mv.addObject("category", category);
		   mv.setViewName("mypost");
	   }
      return mv;
   }
   
   @RequestMapping("updateAucView.me")
   public String updateAucView() {
      return "updateAuc";
   }
   
   @RequestMapping("mUpdate.me")
   public String memberUpdate(@ModelAttribute Member m,
		   						@RequestParam("post") String post,
		   						@RequestParam("address1") String address1,
		   						@RequestParam("address2") String address2,
		   						Model model) {
	   m.setAddress(post + "/" + address1 + "/" + address2);
	   int result = mService.memberUpdate(m);
	   
	   if(result > 0) {
		   Member loginUser = mService.memberLogin(m);
		   model.addAttribute("loginUser", loginUser);
		   return "redirect:myinfo.me";
	   } else {
		   throw new MemberException("회원정보 수정에 실패했습니다.");
	   }
   }
   
   @RequestMapping("updatePwdView.me")
   public String updatePwdView() {
	   return "updatePwd";
   }
   
   /* 11/12 작업중*/
   @ResponseBody
   @RequestMapping("checkPwd.me")
   public String checkPwd(Member m, @RequestParam("user_id") String user_id, @RequestParam("user_pwd") String user_pwd){
	   
	   // 유저 정보 가져오기(user객체에)
	   Member user = mService.memberLogin(m);
	   
	   if(bcryptPasswordEncoder.matches(user_pwd, user.getUser_pwd())) {
		   return "success";
	   } else {
		   return "error";
	   }
   }
   
   @RequestMapping("updatePwd.me")
   public String updatePwd(Model model, @RequestParam("newPwd") String newPwd) {
	   
	   Member loginUser = (Member)model.getAttribute("loginUser");
	   
	   String encPwd = bcryptPasswordEncoder.encode(newPwd);
	   loginUser.setUser_pwd(encPwd);
	   int result = mService.updatePwd(loginUser);
	   
	   if(result > 0) {
		   return "redirect:updatePwdView.me";
	   } else {
		   throw new MemberException("비밀번호 수정에 실패하였습니다.");
	   }
   }
   
   @RequestMapping("mDelete.me")
   public String deleteMember(Model model, SessionStatus ss) {
	   
	   Member m = (Member)model.getAttribute("loginUser");
	   
	   int result = mService.deleteMember(m);
	   
	   if(result > 0) {
		   ss.setComplete();
		   return "redirect:home.do";
	   } else {
		   throw new MemberException("회원 탈퇴에 실패하였습니다.");
	   }
   }
   
   @RequestMapping("adminView.me")
   public String adminView() {
	   return "manageMember";
   }
   
   // ********************************************끝
   
   // 아이디 비밀번호 찾기 컨트롤러
   @RequestMapping("searchidpwd.me")
   public String searchidpwd() {
      return "searchidpwd";
   }
   
   
   
   // 회원가입용 컨트롤러
   
   
   @RequestMapping("ebinsert.me")
   public String insertMember(@ModelAttribute Member m,
                     @RequestParam("zipcode1") String zipcode1,
                     @RequestParam("addr") String addr,
                     @RequestParam("addrDtl")String addrDtl) {
      
   m.setAddress(  zipcode1 + "/" + addr + "/" +addrDtl);
   
   // 비밀번호 암호화
   
   String encPwd = bcryptPasswordEncoder.encode(m.getUser_pwd());
   m.setUser_pwd(encPwd);
   
   System.out.println(m);
   
   int result = mService.insertMember(m);
   
   if(result > 0) {
      return "redirect:home.do";
   }else {
      throw new MemberException("회원가입에 실패하였습니다.");
   }
      
      
      
   }
   
   // 로그인용 컨트롤러
   @RequestMapping("loginView.me")
   public String login() {
      return "login";
   }
   
   // 암호화 후 로그인
   @RequestMapping(value="login.me", method=RequestMethod.POST)
   public String memberLogin(@ModelAttribute Member m ,Model model) {
      Member loginUser = mService.memberLogin(m);
   
      
      if(bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {
         model.addAttribute("loginUser",loginUser);
         
      }else {
         throw new MemberException("로그인에 실패하였습니다.");
      }
      
      if(loginUser != null) {
    	  model.addAttribute("loginUser", loginUser);
    	  return "redirect:home.do";
      } else {
    	  throw new MemberException("로그인에 실패하였습니다.");
      }
      
   }
   
   // 로그아웃 컨트롤러
   @RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:home.do";
	}
   
   @RequestMapping(value="searchId.me", method=RequestMethod.POST)
   public String searchId(@ModelAttribute Member m, Model model) {
      
      Member searchId = mService.searchId(m);
      
      if((m.getUser_name().equals(searchId.getUser_name()) && m.getPhone().equals(searchId.getPhone()))) {
         // 이름과 전화 번호 정보가 같으면 이제 내가 찾는 아이디를 출력 해야 한다. 어떻게?
         // 어떻게 출력을 할까 말까 ㅁㅇ민 ㅕㅎ레 ㅑㄴㅇ ㅗㅎㄴ 오히ㅓ ㅌ ㅍㄴ윺 ㅓㅎㄴㅍㄹ치.ㄴㅌㅇㅎㄿ늌ㅇ ㅍ토ㅓ
         // ajax 로 할수 잇는지 , 아니면 팝업창 또는 alert 창으로 띄어야 하는지
          model.addAttribute("searchId",searchId);
         
         
         
      }else {
         throw new MemberException("아이디 찾기에 실패하였습니다.");
      }
      return "login";
   }
   
   
   
   
   
   @RequestMapping("dupid.me")
   public void idDuplicataCheck(HttpServletResponse response, String user_id) throws IOException {
   boolean isUsable = mService.checkIdDup(user_id) == 0 ? true : false;
   
   response.getWriter().print(isUsable);
   }
   
   
   
   
   
   
   // 아이디 비밀번호 찾기 컨트롤러
   @RequestMapping("search.me")
   public String Search(){
      
      return "SearchIdPwd";
   }


   
/*   @RequestMapping(value="searchId", method=RequestMethod.POST)
   public String searchId(HttpServletResponse response,
                     @RequestParam("user_name")String user_name,
                     @RequestParam("user_email")String user_email,
                     Model model)   {
      
      model.addAttribute("user_id", mService.searchId(response,user_email, user_name));
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      
      String user_id = Manager.searchId(user_name,user_email);
      
      
      
      return "login";
      }*/
   
   
   
   
   
   /*@RequestMapping("searchId.me")
   public String SearchId(Member m, Model model) {
      Member searchId = mService.searchId(m);
      
      if( searchId != null) {
         model.addAttribute("searchid", searchId);
            
         
         
         
      }else {
         throw new MemberException("아이디 조회에 실패하였습니다.");
         
      }
      return "login";
      
   }*/
   
   
   
/*   @RequestMapping("searchPwd.me")
   public ModelAndView sendEmaiAction(@RequestParam Map<String, Object> paramMap, 
                              ModelMap model ) {
            
      // 비밀번호 이메일로 보내기
      ModelAndView mav;
      String id = (String) paramMap.get("user_id");
      String e_mail= (String) paramMap.get("user_email");
      String user_pwd = mService.getPw(paramMap);
      System.out.println(user_pwd);
      
      if(user_pwd != null) {
         email.setContent("고객님께서 요청하신 비밀번호는 " + user_pwd + " 입니다.");
         email.setReceiver(e_mail);
         email.setSubject("evening에서 보내드리는 "+ id + "님의 비밀번호 메일입니다.");
         emailSender.SendMail(email);
         mav = new ModelAndView("redirect:login");
         return mav;
      }else {
         throw new MemberException("메일발송에 실패하였습니다.");
         
      }
   }
*/      
      
      
      
      
   
      
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}