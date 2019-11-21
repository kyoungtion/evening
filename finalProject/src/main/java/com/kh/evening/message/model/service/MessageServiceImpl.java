package com.kh.evening.message.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
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
	private SqlSession sqlSession;
	@Override
	public ArrayList<Message> receiveList() {
		return messageDAO.receiveList(sqlSession);
	}


}
