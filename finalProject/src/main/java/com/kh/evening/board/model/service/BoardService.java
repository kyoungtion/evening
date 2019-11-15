package com.kh.evening.board.model.service;

import java.util.ArrayList;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.PageInfo;

public interface BoardService {
  
	ArrayList<Board> boardList(PageInfo pi, BoardMode bMode);
	
	int getBoardListCount(String boardCategory);
	
	ArrayList<Attachment> boardFileList();

	Board selectOne(int sgId);
	
	Attachment boardFileList(int sgId);

	int viewCount(int sgId);

	ArrayList<String> category();

}
