package com.kh.evening.board.model.service;

import java.util.ArrayList;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.board.model.vo.Reply;
import com.kh.evening.member.model.vo.Member;

public interface BoardService {

  ArrayList<Board> boardList(PageInfo pi, BoardMode bMode);

  int getBoardListCount(String boardCategory);

  ArrayList<Attachment> boardFileList();

  Board selectOne(int sgId);

  Attachment boardFileList(int sgId);

  int viewCount(int sgId);

  ArrayList<String> category();

  int insertAuction(AuctionHistory ah);

  int auctionMaxPrice(int sgId);

	int insertBoard(Board b);

	int insertAttachment(Attachment atm);

	int updateBoard(Board b,int type);

	int updateAttachment(Attachment atm);

	int deleteBoard(int sgId);

	int insertReply(Reply r);

}
