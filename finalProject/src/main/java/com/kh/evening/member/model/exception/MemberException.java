package com.kh.evening.member.model.exception;

public class MemberException extends RuntimeException{
	public MemberException() {}
	public MemberException(String message) {
		super(message);
	}
}