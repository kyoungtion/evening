package com.kh.evening.message.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.message.model.dao.MessageDAO;
import com.kh.evening.message.model.vo.Message;

@Service("messageService")
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDAO messageDAO;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Message> receiveList(String user_ID) {
		return messageDAO.receiveList(sqlSession,user_ID);
	}

	@Override
	public ArrayList<Message> sendList(String user_ID) {
		return messageDAO.sendList(sqlSession,user_ID);
	}

	@Override
	public void insertMessage(Map param) {
		messageDAO.insertMessage(sqlSession,param);
		
	}



}
