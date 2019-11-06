package com.kh.evening.used.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;

@Repository("uDao")
public class UsedDao {

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard",b);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment atm) {
		return sqlSession.insert("boardMapper.attachmentInsert",atm);
	}

}
