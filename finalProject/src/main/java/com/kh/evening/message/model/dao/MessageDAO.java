package com.kh.evening.message.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.evening.message.model.vo.Message;

@Repository("messageDAO")
public class MessageDAO {

	
	public ArrayList<Message> receiveList(SqlSessionTemplate sqlSession, String user_ID) {
		return (ArrayList) sqlSession.selectList("messageMapper.receiveList",user_ID);
	}

	public ArrayList<Message> sendList(SqlSessionTemplate sqlSession, String user_ID) {
		return (ArrayList) sqlSession.selectList("messageMapper.sendList",user_ID);
	}

	public void insertMessage(SqlSessionTemplate sqlSession, Map param) {
		sqlSession.insert("messageMapper.insertBoard",param);
	}



	

}
