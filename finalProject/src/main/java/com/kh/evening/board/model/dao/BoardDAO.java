package com.kh.evening.board.model.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.GoodLike;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.board.model.vo.Reply;

@Repository("bDAO")
public class BoardDAO {

  public ArrayList<Board> boardList(SqlSession sqlSession, PageInfo pi, BoardMode bMode) {

    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); // 건너띄기
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); // 건너띄고, ~만큼 읽기

    return (ArrayList) sqlSession.selectList("boardMapper.boardList", bMode, rowBounds);
  }

  public int getBoardListCount(SqlSession sqlSession, String boardCategory) {
    return sqlSession.selectOne("boardMapper.getAuctionListCount", boardCategory);
  }

  public ArrayList<Attachment> boardFileList(SqlSession sqlSession) {
    return (ArrayList) sqlSession.selectList("boardMapper.boardFileList");
  }

  public Attachment boardFileList(SqlSession sqlSession, int sg_id) {
    return sqlSession.selectOne("boardMapper.boardFileOne", sg_id);
  }

  public Board boardSelectOne(SqlSession sqlSession, int sg_id) {
    return sqlSession.selectOne("boardMapper.boardSelectOne", sg_id);
  }

  public int viewCount(SqlSession sqlSession, int sg_id) {
    sqlSession.update("boardMapper.boardViewCount", sg_id);
    return 1;
  }

  public ArrayList<String> insertF(SqlSession sqlSession) {
    return (ArrayList) sqlSession.selectList("boardMapper.category");
  }

  public int insertAuction(SqlSession sqlSession, AuctionHistory ah) {
    return sqlSession.insert("boardMapper.insertAuction",ah);
  }

  public int auctionMaxPrice(SqlSession sqlSession, int sgId) {
    return sqlSession.update("boardMapper.auctionMaxPrice",sgId);
  }

  public ArrayList<GoodLike> selectGoodLike(SqlSession sqlSession, String userId) {
    return (ArrayList)sqlSession.selectList("boardMapper.selectGoodLike",userId);
  }

  public int insertGoodLike(SqlSession sqlSession, GoodLike user) {
    return sqlSession.insert("boardMapper.insertGoodLike",user);
  }

  public int updateGoodLike(SqlSession sqlSession, GoodLike gl) {
    return sqlSession.update("boardMapper.updateGoodLike",gl);
  }

  public int updateBoardLike(SqlSession sqlSession, GoodLike user) {
    return sqlSession.update("boardMapper.updateBoardLike",user);
  }

  public ArrayList<Board> boardAllList(SqlSession sqlSession, String bCategory) {
    return (ArrayList)sqlSession.selectList("boardMapper.boardAllList",bCategory);
  }


public int insertBoard(SqlSession sqlSession, Board b) {
	return sqlSession.insert("boardMapper.insertBoard",b);
}

public int insertAttachment(SqlSession sqlSession, Attachment atm) {
	return sqlSession.insert("boardMapper.attachmentInsert",atm);
}

public int updateBoard(SqlSession sqlSession, Board b,int type) {
	if(type == 1) {
		return sqlSession.update("boardMapper.uUpdateBoard",b);		
	}else {
		return sqlSession.update("boardMapper.aUpdateBoard",b);				
	}
}

public int updateAttachment(SqlSession sqlSession, Attachment atm) {
	return sqlSession.update("boardMapper.attachmentUpdate",atm);
}

public int deleteBoard(SqlSession sqlSession, int sgId) {
	return sqlSession.update("boardMapper.deleteBoard",sgId);
}

public int insertReply(SqlSession sqlSession, Reply r, boolean add) {
	System.out.println(add);
	if(add) {
		return sqlSession.insert("boardMapper.insertReplyAdd",r);
	}else {
		return sqlSession.insert("boardMapper.insertReply",r);
	}
}

public ArrayList<Reply> selectReplyList(SqlSession sqlSession, int sgId) {
	return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList",sgId);
}

public int deleteReply(SqlSession sqlSession, Reply r) {
	return sqlSession.update("boardMapper.deleteReply",r);
}




}
