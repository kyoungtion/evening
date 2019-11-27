package com.kh.evening.message.model.dao;

import java.util.ArrayList;
import java.util.List;
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

	public List<Map<String, Object>> rmessageDetail(SqlSessionTemplate sqlSession, Map rparam) {
		return sqlSession.selectList("messageMapper.rmessageDetail",rparam);
		
	}

	public List<Map<String, Object>> smessageDetail(SqlSessionTemplate sqlSession, Map sparam) {
		return sqlSession.selectList("messageMapper.smessageDetail",sparam);
	}

	public int checkUpdate(SqlSessionTemplate sqlSession, Map rparam) {
		return sqlSession.update("messageMapper.checkUpdate",rparam);
	}

	public int getCount(SqlSessionTemplate sqlSession, String user_id) {
		return sqlSession.selectOne("messageMapper.getCount",user_id);
	}

	public int deleteRow(SqlSessionTemplate sqlSession, String seq) {
		return sqlSession.update("messageMapper.deleteRow",seq);
	}



	

}