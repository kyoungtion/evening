package com.kh.evening.used.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.evening.board.model.exception.BoardException;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.used.model.service.UsedService;

@Controller
public class UsedController {

	@Autowired
	private UsedService uService;

	@RequestMapping("uInsert.ud")
	public String usedInsert(@ModelAttribute Board b, @RequestParam("uploadFile") MultipartFile uploadFile,
			HttpServletRequest request, HttpServletResponse response) {
		Attachment atm = new Attachment();

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

		int result1 = uService.insertAttachment(atm);

		if (result1 > 0) {
			int result = uService.insertBoard(b);

			if (result > 0) {
				return "redirect:blist.bo";
			} else {
				throw new BoardException("게시글 등록을 실패하였습니다.");
			}
		} else {
			throw new BoardException("썸네일 이미지 등록을 실패하였습니다.");
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
	public String selectOne() {

		return "usedDetail";
	}

	@RequestMapping("updateForm.ud")
	public String updateForm() {

		return "usedUpdateForm";
	}

}
