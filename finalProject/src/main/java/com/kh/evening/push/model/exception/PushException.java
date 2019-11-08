package com.kh.evening.push.model.exception;

public class PushException extends RuntimeException{
	public PushException() {}
	public PushException(String message) {
		super(message);
	}
}