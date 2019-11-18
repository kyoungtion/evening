package com.kh.evening.board.model.service;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.evening.board.model.dao.BoardDAO;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImp implements BoardService {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private BoardDAO bDAO;

	@Override
	public ArrayList<Board> boardList(PageInfo pi, BoardMode bMode) {
		return bDAO.boardList(sqlSession, pi, bMode);
	}

	@Override
	public int getBoardListCount(String boardCategory) {
		return bDAO.getBoardListCount(sqlSession, boardCategory);
	}

	@Override
	public ArrayList<Attachment> boardFileList() {
		return bDAO.boardFileList(sqlSession);
	}

	@Override
	public Board selectOne(int sgId) {
		return bDAO.boardSelectOne(sqlSession, sgId);
	}

	@Override
	public Attachment boardFileList(int sgId) {
		return bDAO.boardFileList(sqlSession, sgId);
	}

	@Override
	public int viewCount(int sgId) {
		return bDAO.viewCount(sqlSession, sgId);
	}

	@Override
	public ArrayList<String> category() {
		return bDAO.insertF(sqlSession);
	}

	@Override
	public int insertAuction(AuctionHistory ah) {
		return bDAO.insertAuction(sqlSession, ah);
	}

	@Override
	public int auctionMaxPrice(int sgId) {
		return bDAO.auctionMaxPrice(sqlSession, sgId);
	}

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);

	}

	@Override
	public int insertAttachment(Attachment atm) {
		return bDAO.insertAttachment(sqlSession, atm);

	}

	@Override
	public int updateBoard(Board b) {
		return bDAO.updateBoard(sqlSession, b);
	}

	@Override
	public int updateAttachment(Attachment atm) {
		return bDAO.updateAttachment(sqlSession, atm);
	}

}
