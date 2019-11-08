package com.kh.evening.member.model.service;

import com.kh.evening.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);


	int checkIdDup(String user_id);




	Member memberLogin(Member m);
	
	Member enrollView(Member m);

}
