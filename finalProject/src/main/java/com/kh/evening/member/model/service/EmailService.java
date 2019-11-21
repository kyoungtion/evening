package com.kh.evening.member.model.service;

import javax.servlet.http.HttpServletResponse;

import com.kh.evening.member.model.vo.Member;

public interface EmailService {

	void send_mail(Member m, String div);

	void searchPwd(HttpServletResponse response, Member m) throws Exception;
	
	

}
