package com.kh.evening.chatting.ws;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/*
 * 스프링 웹소켓을 이용해서 웹소켓 서버 구현
 * 1. WebSocketHandler 인터페이스를 구현
 * 2. <websocket:handlers>를 이용해서 요청URL에 대한 
 * WebSocketHandler 구현 객체 등록
 */
public class EchoHandler extends TextWebSocketHandler {

	//웹 소켓 클라이언트와 연결되면 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(session.getId()+" 연결 됨.");
	}


	// 웹소켓 클라이언트가 데이터를 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(session.getId()+" 로부터 [" + message.getPayload()+"] 받음");
		// 서버에 전송된 메시지를 다시 클라이언트에 전송
		session.sendMessage(new TextMessage("echo : " + message.getPayload()));
	}

	// 웹 소켓 클라이언트와 연결이 종료되면 호출
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId()+" 연결 끊김.");

	}
	
}
  
