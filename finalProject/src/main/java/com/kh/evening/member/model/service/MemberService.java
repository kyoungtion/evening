package com.kh.evening.member.model.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.kh.evening.member.model.vo.Member;

public interface MemberService {

   int insertMember(Member m);


   int checkIdDup(String user_id);

   Member memberLogin(Member m);
   
   Member enrollView(Member m);


   //Member searchId(Member m);


   String getPw(Map<String, Object> paramMap);


   Member searchId(Member m);


   //Object searchId(HttpServletResponse response, String user_name, String user_email);

   
   

}