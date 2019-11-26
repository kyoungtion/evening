package com.kh.evening.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class GoodLike {

  private int Gl_Id;        // 좋아요 번호
  private String User_Id;   // 유저 아이디
  private int Sg_id;        // 게시판 번호
  private int Gl_check;     // 좋아요 여부 ( 1이면 좋아요 0이면 아니요 )
  
  private Board board;
}
