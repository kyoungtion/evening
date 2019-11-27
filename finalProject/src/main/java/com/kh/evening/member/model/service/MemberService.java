package com.kh.evening.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;
import com.kh.evening.member.model.vo.Member;

public interface MemberService {
   
   int insertMember(Member m);

   int checkIdDup(String user_id);

   Member memberLogin(Member m);

   Member enrollView(Member m);

   String searchId(Member m);

   Member kakaoLogin(Member m);
   
   
   //경희
   
   String getPw(Map<String, Object> paramMap);

   int memberUpdate(Member m);

   int updatePwd(Member loginUser);

   int deleteMember(Member m);

   int getMyPostListCount(Map<String, String> map);

   ArrayList<Gesipan> selectMyPost(PageInfo pi, Map<String, String> map);

   int getMemberListCount(String mType);

   ArrayList<Member> getMembers(PageInfo pi, String mType);

   int updateRankCode(Member m);

   int deleteAllMember(String[] idArray);

   int getSearchMemberListCount(Map<String, String> parameters);

   ArrayList<Member> getSearchMemberList(PageInfo pi, Map<String, String> parameters);

   int getDeActiMemberListCount(String memberType);

   ArrayList<Member> getDeActiMemberList(PageInfo pi, String memberType);

   int activateMember(Member m);

   int activateAllMember(String[] idArray);

   int requestSeller(Member m);

   int getSellerRequestListCount();

   ArrayList<Member> getSellerRequestListCount(PageInfo pi);

   int acceptMember(Member m);

   int acceptAllMember(String[] idArray);

int getSellerListCount();

ArrayList<Member> getSellerList(PageInfo pi);

int updatePenaltyPoint(Member user);




Member memberSearchPwd(Map<String, String> map);

int  changePwd(Map<String, String> map);


}