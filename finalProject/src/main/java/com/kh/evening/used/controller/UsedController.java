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
	
	@RequestMapping("insertImg.ud")
	public void textInsertImg(@RequestParam("trImgFile") MultipartFile uploadFile,
								HttpServletRequest request,HttpServletResponse response) throws IOException {
		String imgrename= saveImg(uploadFile,request,response);
		System.out.println("test");
	}
	
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
	
	
	
	
	public String saveImg(MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\usedTextImgs";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String oringinFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+ (int)(Math.random()*1000)+1 +"."
								+ oringinFileName.substring(oringinFileName.lastIndexOf(".")+1);
		String renamePath = folder+"\\"+renameFileName;
		
		JSONObject result = new JSONObject();
		result.put("imgName", renameFileName);
		
		response.setContentType("application/json");
		response.getWriter().print(result.toJSONString());
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
}
