package com.kh.evening.used.model.service;

import org.springframework.stereotype.Service;

import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;

@Service("uService")
public interface UsedService {

	int insertBoard(Board b);

	int insertAttachment(Attachment atm);

}
