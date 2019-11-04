package com.kh.evening.board.model.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {

  public ArrayList<Board> boardList(SqlSession sqlSession, PageInfo pi) {
    
    int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit(); // 건너띄기
    RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit()); // 건너띄고, ~만큼 읽기
    
    return (ArrayList)sqlSession.selectList("boardMapper.boardList",null, rowBounds);
  }

  public int getAuctionListCount(SqlSession sqlSession) {
    return sqlSession.selectOne("boardMapper.getAuctionListCount");
  }

  
}