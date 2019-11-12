package com.kh.evening.used.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.board.model.exception.BoardException;
import com.kh.evening.board.model.service.BoardService;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.used.model.service.UsedService;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@Controller
public class UsedController {

	@Autowired
	private UsedService uService;
	
	@Autowired
	private BoardService bService;

	@RequestMapping("uInsert.ud")
	public String usedInsert(@ModelAttribute Board b, @RequestParam("smImg") MultipartFile uploadFile,
			HttpServletRequest request, HttpServletResponse response) {
		Attachment atm = new Attachment();
//		b.setSG_PRICE(Integer.parseInt(b.getSG_PRICE()));
		if (uploadFile != null && !uploadFile.isEmpty()) {

			String renameFileName;
			try {
				renameFileName = saveFile(uploadFile, request, response);
				if (renameFileName != null) {
					atm.setORIGINALFILENAME(uploadFile.getOriginalFilename());
					atm.setRENAMEFILENAME(renameFileName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		request.getParameter("imgNames");
		
		String[] allName=request.getParameter("imgNames").split(",");
		String[] saveName=request.getParameter("deletImg").split(",");
		String root = request.getSession().getServletContext().getRealPath("resources")
				+"\\textImgs/";
		File file;
		for(int i=0;i<saveName.length;i++) {
			for(int j=0; j<allName.length; j++) {
				if(saveName[i].equals(allName[j])) {
					allName[j]="N";
				}
			}	
		}
		for(int i=0; i < allName.length;i++) {
			if(!allName[i].equals("N")) {
				file = new File(root+allName[i]);
				System.out.println("파일 삭제 확인 : " + file.delete());
			}
		}
		
		int result1 =uService.insertBoard(b);

		if (result1 > 0) {
			int result =  uService.insertAttachment(atm);

			if (result > 0) {
				return "redirect:home.do";
			} else {
				for(int i=0;i<allName.length;i++) {
					if(!allName[i].equals("N")) {
						file = new File(root+allName[i]);
						System.out.println("파일 삭제 확인 : " + file.delete());
					}
				}
				throw new BoardException("썸네일 이미지 등록을 실패하였습니다.");
			}
		} else {
			for(int i=0;i<allName.length;i++) {
				if(!allName[i].equals("N")) {
					file = new File(root+allName[i]);
					System.out.println("파일 삭제 확인 : " + file.delete());
				}
			}
			throw new BoardException("게시물 등록을 실패하였습니다.");
		}

	}

	public String saveFile(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\textImgs";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String oringinFileName = file.getOriginalFilename();
		String renameFileName = "i" + sdf.format(new java.sql.Date(System.currentTimeMillis()))
				+ (int) (Math.random() * 1000) + 1 + "."
				+ oringinFileName.substring(oringinFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
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
	public ModelAndView selectOne(@RequestParam("sgId") int sgId,ModelAndView mv) {

		Board board = bService.selectOne(sgId);
		Attachment at = bService.boardFileList(sgId);
		if(board != null) {
		
			mv.addObject("board",board)
				.setViewName("usedDetail"); 
		}else {
			throw new BoardException("게시글 읽기를 실패하였습니다.");
		}
		
		return mv;
	}

	@RequestMapping("updateForm.ud")
	public String updateForm() {

		return "usedUpdateForm";
	}

}
