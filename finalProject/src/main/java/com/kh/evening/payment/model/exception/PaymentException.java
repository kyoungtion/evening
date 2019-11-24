package com.kh.evening.payment.model.exception;

public class PaymentException extends RuntimeException{
	public PaymentException() {}
	public PaymentException(String message) {
		super(message);
	}

}
