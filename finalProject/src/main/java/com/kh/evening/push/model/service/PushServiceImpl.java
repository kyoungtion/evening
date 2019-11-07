package com.kh.evening.push.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.member.model.dao.MemberDAO;
import com.kh.evening.push.model.dao.PushDAO;

@Service("pService")
public class PushServiceImpl implements PushService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PushDAO pDAO;
}