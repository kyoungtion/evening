package com.kh.evening.message.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

	@Override
	public List<Map<String, Object>> rmessageDetail(Map rparam) {
		return messageDAO.rmessageDetail(sqlSession,rparam);
	}

	@Override
	public List<Map<String, Object>> smessageDetail(Map sparam) {
		return messageDAO.smessageDetail(sqlSession,sparam);
	}

	@Override
	public int checkUpdate(Map rparam) {
		return messageDAO.checkUpdate(sqlSession,rparam);
	}

	@Override
	public int getCount(String user_id) {
		return messageDAO.getCount(sqlSession,user_id);
	}

	@Override
	public int deleteRow(String seq) {
		return messageDAO.deleteRow(sqlSession,seq);
	}



	



}