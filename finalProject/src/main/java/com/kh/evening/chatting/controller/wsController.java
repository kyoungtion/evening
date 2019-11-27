package com.kh.evening.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class wsController {

		@RequestMapping("chat.ch")
		public String wController() {
			return "chat";
		}
}