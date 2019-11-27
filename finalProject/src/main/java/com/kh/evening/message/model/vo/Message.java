package com.kh.evening.message.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Message {
	private int m_NO;
	private String m_SEND;
	private String m_RECEIVE; 
	private String m_TITLE;
	private String m_CONTENT;
	private Date m_ENROLL_DATE;
	private String m_STATUS;
	private String m_CLICKED;

}