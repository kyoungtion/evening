package com.kh.evening.gesipan.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;
import com.kh.evening.gesipan.model.vo.GesipanReply;

@Repository("gDAO")
public class GesipanDAO {

	public int insertGesipan(SqlSessionTemplate sqlSession, Gesipan g) {
		return sqlSession.insert("gMapper.insertGesipan", g);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("gMapper.selectListCount", category);
	}

	public ArrayList<Gesipan> selectGesipanList(SqlSessionTemplate sqlSession, PageInfo pi, String category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("gMapper.selectGesipanList", category, rb);
	}

	public int selectSearchListCount(SqlSessionTemplate sqlSession, Map<String, String> parameters) {
		return sqlSession.selectOne("gMapper.selectSearchListCount", parameters);
	}

	public ArrayList<Gesipan> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
			Map<String, String> parameters) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("gMapper.selectSearchList", parameters, rb);
	}

	public Gesipan selectGesipan(SqlSessionTemplate sqlSession, int g_id) {
		return sqlSession.selectOne("gMapper.selectGesipan", g_id);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int g_id) {
		return sqlSession.update("gMapper.addReadCount", g_id);
	}
	
	public ArrayList<GesipanReply> selectReplyList(SqlSessionTemplate sqlSession, int g_ref) {
		return (ArrayList)sqlSession.selectList("gMapper.selectReplyList", g_ref);
	}

	public int insertReply(SqlSessionTemplate sqlSession, GesipanReply r) {
		return sqlSession.insert("gMapper.insertReply", r);
	}

	public Integer getReplyCount(SqlSessionTemplate sqlSession, Integer g_ref) {
		return sqlSession.selectOne("gMapper.getReplyCount", g_ref);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("gMapper.updateReply", map);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Integer r_id) {
		return sqlSession.update("gMapper.deleteReply", r_id);
	}

	public int updateGesipan(SqlSessionTemplate sqlSession, Gesipan g) {
		return sqlSession.update("gMapper.updateGesipan", g);
	}

	public int deleteGesipan(SqlSessionTemplate sqlSession, int g_id) {
		return sqlSession.update("gMapper.deleteGesipan", g_id);
	}

	public int reGesipan(SqlSessionTemplate sqlSession, Gesipan g) {
		return sqlSession.insert("gMapper.reInsert", g);
	}

	public int getListCountByType(SqlSessionTemplate sqlSession, String type) {
		return sqlSession.selectOne("gMapper.getListCountByType", type);
	}

	public ArrayList<Gesipan> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, String type) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("gMapper.selectNoticeList", type, rb);
	}

	public int deleteAllNotice(SqlSessionTemplate sqlSession, String[] idArray) {
		return sqlSession.update("gMapper.deleteAllNotice", idArray);
	}

	public int getQnaListCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("gMapper.getQnaListCount", category);
	}

	public ArrayList<Gesipan> getQnaList(SqlSessionTemplate sqlSession, PageInfo pi, String category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("gMapper.selectQnaList", category, rb);
	}



	/*public int getCListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gMapper.selectCListCount");
	}
	public int getSListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gMapper.selectSListCount");
	}
	public int getQListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gMapper.selectQListCount");
	}*/

	/*public ArrayList<Gesipan> selectCommunityList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gMapper.selectCommunityList", null, rb);
	}

	public ArrayList<Gesipan> selectSellingList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gMapper.selectSellingList", null, rb);
	}

	public ArrayList<Gesipan> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gMapper.selectQnaList", null, rb);
	}*/

	

}
