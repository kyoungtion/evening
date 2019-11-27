package com.kh.evening.board.model.vo;

import java.sql.Date;
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
public class AuctionHistory {
  
  private int a_Id;             // 경매번호
  private String User_Id;       // 유저 아이디
  private int Sg_Id;            // 게시판 번호
  private int a_Price;          // 입찰액
  private Date a_Enroll_Date;   // 등록일
  private String a_Check;       // 입찰취소여부
  private Board board;
}
