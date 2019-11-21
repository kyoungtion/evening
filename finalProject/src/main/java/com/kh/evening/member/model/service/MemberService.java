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

	String getPw(Map<String, Object> paramMap);

	int memberUpdate(Member m);

	int updatePwd(Member loginUser);

	int deleteMember(Member m);

	int getMyPostListCount(Map<String, String> map);

	ArrayList<Gesipan> selectMyPost(PageInfo pi, Map<String, String> map);

	String searchId(Member m);


	
}