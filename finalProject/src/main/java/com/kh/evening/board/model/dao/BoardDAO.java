package com.kh.evening.board.model.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {

  public ArrayList<Board> auctionList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit(); // 건너띄기
    RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit()); // 건너띄고, ~만큼 읽기
    
    return (ArrayList)sqlSession.selectList("boardMapper.auctionList",null, rowBounds);
  }

  public int getAuctionListCount(SqlSession sqlSession) {
    return sqlSession.selectOne("boardMapper.getAuctionListCount");
  }

  public ArrayList<Board> auctionEndTimeList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = ( pi.getCurrentPage() - 1) * pi.getBoardLimit();
    RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
    
    return (ArrayList)sqlSession.selectList("boardMapper.auctionEndTimeList",null, rowBounds);
  }

  public ArrayList<Attachment> boardFileList(SqlSession sqlSession) {
    return (ArrayList)sqlSession.selectList("boardMapper.boardFileList");
  }

  public int getSecondGoodListCount(SqlSession sqlSession) {
    return sqlSession.selectOne("boardMapper.getSecondGoodListCount");
  }

  public ArrayList<Board> secondGoodBoardList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
    
    return (ArrayList)sqlSession.selectList("boardMapper.secondGoodBoardList", null, rowBounds);
  }

  public ArrayList<Board> auctionPriceAscList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
    
    return (ArrayList)sqlSession.selectList("boardMapper.auctionPriceAscList", null, rowBounds);
  }

  public ArrayList<Board> auctionPriceDescList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
    
    return (ArrayList)sqlSession.selectList("boardMapper.auctionPriceDescList",null, rowBounds);
  }

  public ArrayList<Board> secondGoodPriceAscList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
    RowBounds rowBounds= new RowBounds ( offset, pi.getBoardLimit());
    
    return (ArrayList)sqlSession.selectList("boardMapper.secondGoodPriceAscList",null, rowBounds);
  }

  public ArrayList<Board> secondGoodPriceDescList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
    
    return (ArrayList)sqlSession.selectList("boardMapper.secondGoodPriceDescList",null, rowBounds);
  }

  public ArrayList<Board> auctionCountList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds ( offset, pi.getBoardLimit());
    
    return (ArrayList)sqlSession.selectList("boardMapper.auctionCountList", null, rowBounds);
  }

  public ArrayList<Board> secondGoodCountList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
    RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
    
    return (ArrayList) sqlSession.selectList("boardMapper.secondGoodCountList",null, rowBounds);
  }



  
}
