package com.kh.evening.message.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.DATE;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Message {
	private int M_NO;
	private String M_SEND;
	private String M_RECEIVE; 
	private String M_TITLE;
	private String M_CONTENT;
	private DATE M_ENROLL_DATE;


}
