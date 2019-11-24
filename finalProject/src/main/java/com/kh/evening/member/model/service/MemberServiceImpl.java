package com.kh.evening.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.kh.evening.gesipan.model.service.GesipanService;
import com.kh.evening.gesipan.model.vo.Gesipan;
//import com.kh.evening.member.email.EmailSender;
import com.kh.evening.member.model.exception.MemberException;
import com.kh.evening.member.model.service.KakaoAPI;
import com.kh.evening.member.model.service.MemberService;
import com.kh.evening.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
   
   @Autowired
   private MemberService mService;
   
   @Autowired
   private GesipanService gService;
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   @Autowired
   private KakaoAPI kakao;
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
      pi = Pageination.getQnaPageInfo(currentPage, listCount);
      
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
   
   
   // 관리자 화면 회원보기
   @RequestMapping("adminView.ad")
   public ModelAndView adminView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = mService.getMemberListCount();
      
      PageInfo pi = null;
      pi = Pageination.getGesipanPageInfo(currentPage, listCount);
      
      ArrayList<Member> list = mService.getMembers(pi);
      
      if(list != null) {
         mv.addObject("list", list).addObject("pi", pi).setViewName("manageMember");
      }
      return mv;
   }
   
   @RequestMapping("deactivatedMember.ad")
   public ModelAndView deactivatedMember(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
     int currentPage = 1;
     if(page != null) {
        currentPage = page;
     }
     
     int listCount = mService.getDeActiMemberListCount();
     
     PageInfo pi = null;
     pi = Pageination.getGesipanPageInfo(currentPage, listCount);
     
     ArrayList<Member> list = mService.getDeActiMemberList(pi);
     
     if(list != null) {
        mv.addObject("dList", list).addObject("pi", pi).setViewName("manageMember");
     }
     
     return mv;
   }
   
   @RequestMapping("memberLevelView.ad")
   public String memberLevelView(Model model, @RequestParam("user_id") String user_id) {
      
      Member m = new Member();
      m.setUser_id(user_id);
      
      Member result = mService.memberLogin(m);
      model.addAttribute("m", result);
      return "MemberLevelView";
   }
   
   @RequestMapping("updateRankCode.ad")
   public String updateRackCode(@RequestParam("user_id") String user_id, @RequestParam("rank_code") String rank_code, Model model) {
      Member m = new Member();
      m.setUser_id(user_id);
      m.setRank_code(rank_code);
      
      int result = mService.updateRankCode(m);
      
      if(result > 0) {
         Member resultMember = mService.memberLogin(m);
         model.addAttribute("user_id", resultMember.getUser_id());
         return "redirect:memberLevelView.ad";
      } else {
         throw new MemberException("등급 변경에 실패하였습니다.");
      }
      
   }
   
   @RequestMapping("memberDelete.ad")
   public String memberDelete(@RequestParam("user_id") String user_id) {
      
      Member m = new Member();
      m.setUser_id(user_id);
      
      int result = mService.deleteMember(m);
      
      if(result > 0) {
         return "redirect:adminView.ad";
      } else {
         throw new MemberException("회원삭제에 실패했습니다.");
      }
   }
   
   @RequestMapping("memberActivate.ad")
   public String memberActivate(@RequestParam("user_id") String user_id) {
      Member m = new Member();
      m.setUser_id(user_id);
      
      int result = mService.activateMember(m);
      
      if(result > 0) {
         return "redirect:deactivatedMember.ad";
      } else {
         throw new MemberException("회원 활성화에 실패했습니다.");
      }
            
   }
   
   @RequestMapping("deleteAllMember.ad")
   public String memberDeleteAll(@RequestParam("ids") String ids) {
      String[] idArray = ids.split(",");
      
      int result = mService.deleteAllMember(idArray);
      
      if(result > 0) {
         return "redirect:adminView.ad";
      } else {
         throw new MemberException("선택한 회원 삭제에 실패했습니다.");
      }
   }
   
   @RequestMapping("activateAllMember.ad")
   public String activateAllMember(@RequestParam("ids") String ids) {
      String[] idArray = ids.split(",");
      
      int result = mService.activateAllMember(idArray);
      
      if(result > 0) {
         return "redirect:deactivatedMember.ad";
      } else {
         throw new MemberException("선택한 회원 활성화에 실패했습니다.");
      }
   }
   
   @RequestMapping("deleteAllNotice.ad")
   public String noticeDeleteAll(@RequestParam("ids") String ids, Model model) {
      String[] idArray = ids.split(",");
      
      int result = gService.deleteAllNotice(idArray);
      
      if(result > 0) {
         model.addAttribute("viewName", "adminNotice");
         return "redirect:adminNoticeView.ad";
      } else {
         throw new MemberException("선택한 공지글 삭제에 실패했습니다.");
      }
   }
   
   @RequestMapping("qna.ad")
   public ModelAndView adminQnaView(@RequestParam(value="category", required=false) String category, @RequestParam(value="page", required=false) Integer page, 
                              ModelAndView mv, @RequestParam(value="viewName", required=false) String viewName)  {
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = gService.getQnaListCount(category);   
      
      PageInfo pi = null;
      pi = Pageination.getQnaPageInfo(currentPage, listCount);
      
      ArrayList<Gesipan> list = gService.selectQnaList(pi, category);
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("pi", pi);
         mv.setViewName("adminQnaView");
      }
      return mv;
   }
   
   @RequestMapping("adminNoticeView.ad")
   public ModelAndView adminNoticeView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv,
                                 @RequestParam(value="viewName", required=false) String viewName){
      String type = "N";
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = gService.getListCountByType(type);
      
      PageInfo pi = null;
      pi = Pageination.getQnaPageInfo(currentPage, listCount);
      
      ArrayList<Gesipan> list = gService.selectNoticeList(pi, type);
      
      
      if(list != null) {
         mv.addObject("pi", pi);
         mv.addObject("list", list);
         mv.setViewName(viewName);
      }
      return mv;
   }
   
   @RequestMapping("memberSearch.ad")
   public ModelAndView memberSearch(@RequestParam(value="page", required=false) Integer page,
                        @RequestParam("searchfor") String searchfor,
                        @RequestParam("keyword") String keyword,
                        ModelAndView mv) throws UnsupportedEncodingException {
      
      Map<String, String> parameters = new HashMap<>();
      parameters.put("searchfor", URLDecoder.decode(searchfor, "UTF-8"));
      parameters.put("keyword", URLDecoder.decode(keyword, "UTF-8"));
      
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = mService.getSearchMemberListCount(parameters);
      PageInfo pi = Pageination.getGesipanPageInfo(currentPage, listCount);
      
      ArrayList<Member> list = mService.getSearchMemberList(pi, parameters);
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("pi", pi);
         mv.setViewName("manageMember");
      } else {
         throw new MemberException("검색한 멤버 조회에 실패하였습니다.");
      }
      return mv;
   }
   
   @RequestMapping("manageSeller.ad")
   public ModelAndView manageSellerView(@RequestParam(value="page", required=false) Integer page,
                                 ModelAndView mv) {
      
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = mService.getSellerRequestListCount();
      PageInfo pi = Pageination.getGesipanPageInfo(currentPage, listCount);
      
      ArrayList<Member> list = mService.getSellerRequestListCount(pi);
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("pi", pi);
         mv.setViewName("manageSeller");
      } else {
         throw new MemberException("판매자 신청 회원 조회에 실패하였습니다.");
      }
      return mv;
   }
   
   // 판매자 전환 신청
   @ResponseBody
   @RequestMapping("sellerRequest.me")
   public String sellerRequest(Model model) {
      Member m = (Member)model.getAttribute("loginUser");
      
      int result = mService.requestSeller(m);
      
      if(result > 0) {
         Member loginUSer = mService.memberLogin(m);
         model.addAttribute("loginUser", loginUSer);
         return "success";
      } else {
         throw new MemberException("판매자 전환 신청에 실패하였습니다.");
      }
   }
   
   @RequestMapping("memberAccept.ad")
   public String memberAccept(@RequestParam("user_id") String user_id) {
      Member m = new Member();
      m.setUser_id(user_id);
      
      int result = mService.acceptMember(m);
      
      if(result > 0) {
         return "redirect:manageSeller.ad";
      } else {
         throw new MemberException("등급 조정에 실패하였습니다.");
      }
   }
   
   @RequestMapping("memberAcceptAll.ad")
   public String memberAcceptAll(@RequestParam("ids") String ids) {
      String[] idArray = ids.split(",");
      int result = mService.acceptAllMember(idArray);
      if(result > 0) {
         return "redirect:manageSeller.ad";
      } else {
         throw new MemberException("선택한 회원 등급 조정에 실패하였습니다.");
      }
   }
   
   // ********************************************끝
   

   // 상은
// 상은 *******************
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
   
   @RequestMapping(value="kakaoCallback.me" ,method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView kakao(@RequestParam("code")String code,
                         HttpSession session,
                         HttpServletResponse response,
                         ModelAndView mv,
                         Model model) {
      String access_Token = kakao.getAccessToken(code);
      System.out.println("code : " + code);
       HashMap<String, String> userInfo = kakao.getUserInfo(access_Token);
       System.out.println("login Controller : " + userInfo);
       
       //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
       if (userInfo.get("email") != null) {
          
          // 맴버 객체 생성 후 kakaoId 값 들고 디비로 넘어가서 가입된 멤버인지 확인하기
          
          Member m = new Member();
          //m.setKakaoId(userInfo.get("kakaoId"));
          m.setUser_email(userInfo.get("email"));
          Member loginUser = mService.kakaoLogin(m);
          System.out.println("kakaoLoing : " +loginUser );
          if(loginUser != null ) {
             model.addAttribute("loginUser", loginUser);
             mv.setViewName("redirect:home.do");
             

          }
          
           /*session.setAttribute("userId", userInfo.get("email"));
           session.setAttribute("access_Token", access_Token);*/
       }
      return mv;
      
     
   }
   
   
   
   // 암호화 후 로그인
   @SuppressWarnings("unused")
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
   // 유효성 검사
   @RequestMapping("dupid.me")
   public void idDuplicataCheck(HttpServletResponse response, String user_id) throws IOException {
      boolean isUsable = mService.checkIdDup(user_id) == 0 ? true : false;
      
      response.getWriter().print(isUsable);
   }

   
   // 로그아웃 컨트롤러
   @RequestMapping("logout.me")
   public String logout(SessionStatus status) {
      status.setComplete();
      return "redirect:home.do";
   }
   
   
   // 아이디, 비밀번호 찾기 컨트롤러
   @RequestMapping("search.me")
   public String Search(){
      
      return "SearchIdPwd";
   }
   
   // 아이디 찾기
   @RequestMapping(value="searchId.me", method=RequestMethod.POST)
   @ResponseBody
   public String searchId(@RequestParam("user_name") String user_name,
                       @RequestParam("phone") String phone, 
                       Model model,
                       HttpServletResponse response) throws IOException {
      
     Member m = new Member();
     m.setUser_name(user_name);
     m.setPhone(콜);

     String searchId = mService.searchId(m);
     
    
      return searchId;
   }
   
   
   // 비밀번호 찾기
   /*@RequestMapping(value="searchPwd", method = RequestMethod.POST)
   public void searchPwd(   
                        @RequestParam("user_id") String user_id,
                        @RequestParam("user_email")String user_email,
                        Model model,
                        HttpServletResponse response) throws Exception {
      
      Member m = new Member();
      m.setUser_id(user_id);
      m.setUser_email(user_email);
     service.searchPwd(response,m);
         
      
   }*/
   
   
   
   
   
   
   
   
  


   
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
}