package com.kh.evening.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.member.model.dao.MemberDAO;
import com.kh.evening.member.model.vo.Member;

@Service
public class EmailServiceImpl implements EmailService {
	

	@Inject
	private MemberDAO manager;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDAO mDAO;

	
	// 이메일 발송
	@Override
	public void send_mail(Member m, String div) {
		
	
	// mail Server 설정
	String charSet = "utf-8";
	String hostSMTP = "smtp.naver.com";
	String hostSMTPid = "rendro5@naver.com";
	String hostSMTPpwd = "tkddms2354";

	// 보내는 사람 EMail, 제목, 내용
	String fromEmail = "rendro5@naver.com";
	String fromName = "EVENING";
	String subject = "";
	String msg = "";

	if(div.equals("searchPwd")) {
		// 비밀번호 변경 메일 내용
		subject = "Spring Homepage 임시 비밀번호 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += m.getUser_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += m.getUser_pwd() + "</p></div>";
	}else if(div.equals("join")) {
		
	}
	// 받는 사람 E-Mail 주소
	String mail = m.getUser_email();
	try {
		HtmlEmail email = new HtmlEmail();
		email.setDebug(true);
		email.setCharset(charSet);
		email.setSSL(true);
		email.setHostName(hostSMTP);
		email.setSmtpPort(465); // SMTP 포트

		email.setAuthentication(hostSMTPid, hostSMTPpwd);
		email.setTLS(true);
		email.addTo(mail, charSet);
		email.setFrom(fromEmail, fromName, charSet);
		email.setSubject(subject);
		email.setHtmlMsg(msg);
		email.send();
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("메일발송 실패 : " + e);
	}
}


	@Override
	public void searchPwd(HttpServletResponse response, Member m) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if(manager.check_id(m.getUser_id()) == 0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!m.getUser_email().equals(manager.login(m.getUser_email()))) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String user_pwd = "";
			for (int i = 0; i < 12; i++) {
				user_pwd += (char) ((Math.random() * 26) + 97);
			}
			m.setUser_pwd(user_pwd);
			// 비밀번호 변경
			manager.update_pw(m);
			// 비밀번호 변경 메일 발송
			send_mail(m, "searchPwd");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	











}






