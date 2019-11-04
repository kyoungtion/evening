package com.kh.evening.used.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.evening.used.model.service.UsedService;



@Controller
public class UsedController {

	@Autowired
	private UsedService uService;
	
	@RequestMapping("usedListAll.ud")
	public String selectListAll() {
		
		
		return "UsedList";
	}
	@RequestMapping("insertForm.ud")
	public String insertForm() {
		
		
		return "usedInsertForm";
	}
	@RequestMapping("selectOne.ud")
	public String selectOne() {
		
		
		return "usedDetail";
	}
	@RequestMapping("updateForm.ud")
	public String updateForm() {
		
		
		return "usedUpdateForm";
	}
	
	
	
	
}
