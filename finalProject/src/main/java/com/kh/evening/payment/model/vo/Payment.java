package com.kh.evening.payment.model.vo;

import java.sql.Date;

import com.kh.evening.board.model.vo.Board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Payment {

	private int p_No;			// 결제 리스트 번호
	private String p_ID;		// 결제자 아이디
	private String p_NICKNAME;	// 결제자 닉네임
	private String p_ADDRESS;	// 결제자 주소
	private String p_PHONE;		// 결제자 핸드폰 번호
	private String p_EMAIL;		// 결제자 이메일
	private Date PAYDAY;		// 결제 날짜
	private Date p_UPDATE_DATE;	// 결제 수정 날짜
	private String p_STATUS;	// 결제 상태
	private int MONEY;			// 결제 금액
	private String MEMO;		// 배송시 메모
	private String gp_ID;		// 상품 정보

	private Board board;


	
}
