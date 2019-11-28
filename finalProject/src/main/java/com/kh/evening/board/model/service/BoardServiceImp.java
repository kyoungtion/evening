package com.kh.evening.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.evening.board.model.dao.BoardDAO;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.GoodLike;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.board.model.vo.Reply;

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
    return bDAO.insertAuction(sqlSession,ah);
  }

  @Override
  public int auctionMaxPrice(int sgId) {
    return bDAO.auctionMaxPrice(sqlSession, sgId);
  }

  @Override
  public ArrayList<GoodLike> selectGoodLike(String userId) {
    return bDAO.selectGoodLike(sqlSession,userId);
  }

  @Override
  public int insertGoodLike(GoodLike user) {
    return bDAO.insertGoodLike(sqlSession,user);
  }

  @Override
  public int updateGoodLike(GoodLike gl) {
    return bDAO.updateGoodLike(sqlSession,gl);
  }

  @Override
  public int updateBoardLike(GoodLike user) {
    return bDAO.updateBoardLike(sqlSession,user);
  }

  @Override
  public ArrayList<Board> boardAllList(String bCategory) {
    return bDAO.boardAllList(sqlSession,bCategory);
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
	public int updateBoard(Board b,int type) {
		return bDAO.updateBoard(sqlSession, b,type);
	}

	@Override
	public int updateAttachment(Attachment atm) {
		return bDAO.updateAttachment(sqlSession, atm);
	}

	@Override
	public int deleteBoard(int sgId) {
		return bDAO.deleteBoard(sqlSession,sgId);
	}

	@Override
	public int insertReply(Reply r, boolean add) {
		return bDAO.insertReply(sqlSession,r,add);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int sgId,PageInfo pi) {
		return bDAO.selectReplyList(sqlSession,sgId,pi);
	}

	@Override
	public int deleteReply(Reply r,boolean type) {
		return bDAO.deleteReply(sqlSession,r,type);
	}

	@Override
	public int getReplyListCount(int sG_ID) {
		return bDAO.geyReplyListCount(sqlSession,sG_ID);
	}

	@Override
	public int replyUpdate(Reply r) {
		return bDAO.replyUpdate(sqlSession,r);
	}

	

	@Override
	public int getBoardListCount(Map<String, String> map) {
		return bDAO.myBoardListCount(sqlSession, map);
	}


	@Override
	public ArrayList<Board> myBoardList(PageInfo pi, Map<String, String> map) {
		return bDAO.myBoardList(sqlSession, pi, map);
	}


	@Override
	public int getAuctionHistoryCount(String user_id) {
		return bDAO.getAuctionHistoryCount(sqlSession, user_id);
	}

	@Override
	public ArrayList<AuctionHistory> getAuctionHistoryList(PageInfo pi, String user_id) {
		return bDAO.getAuctionHistoryList(sqlSession, pi, user_id);
	}

	@Override
	public ArrayList<Board> myLikeList(PageInfo pi, Map<String, String> map) {
		return bDAO.myLikeList(sqlSession, pi, map);
	}

	@Override
	public int myLikeListCount(Map<String, String> map) {
		return bDAO.myLikeListCount(sqlSession, map);
	}

	@Override
	public int updateall(String user_id) {
		return bDAO.updateall(sqlSession, user_id);
	}



}
