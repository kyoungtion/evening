package com.kh.evening.board.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.evening.board.model.exception.BoardException;
import com.kh.evening.board.model.service.BoardService;
import com.kh.evening.board.model.service.BoardServiceImp;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.board.model.vo.Reply;
import com.kh.evening.common.Pageination;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	@RequestMapping("auctionList.bo")
	public ModelAndView auctionList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			@RequestParam(value = "mode", required = false) String mode) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		String modeSet = "recent";
		if (mode != null) {
			modeSet = mode;
		}

		String boardCategory = "A";
		int listCount = bService.getBoardListCount(boardCategory);
		PageInfo pi = Pageination.getPageInfo(currentPage, listCount);

		BoardMode bMode = new BoardMode(modeSet, boardCategory);

		ArrayList<Board> alist = bService.boardList(pi, bMode);
		ArrayList<Attachment> af = bService.boardFileList();

		if (alist != null) {
			mv.addObject("alist", alist);
			mv.addObject("pi", pi);
			mv.addObject("modeSet", modeSet);
			mv.addObject("af", af);
			mv.setViewName("auctionBoard");
		} else {
			throw new BoardException("경매 게시판 조회 실패.");
		}

		return mv;
	}

	@RequestMapping("secondgoodList.bo")
	public ModelAndView secondGoodList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			@RequestParam(value = "mode", required = false) String mode) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		String modeSet = "recent";
		if (mode != null) {
			modeSet = mode;
		}

		String boardCategory = "SG";
		int listCount = bService.getBoardListCount(boardCategory);
		PageInfo pi = Pageination.getPageInfo(currentPage, listCount);

		BoardMode bMode = new BoardMode(modeSet, boardCategory);

		ArrayList<Board> alist = bService.boardList(pi, bMode);
		ArrayList<Attachment> af = bService.boardFileList();

		if (alist != null) {
			mv.addObject("alist", alist);
			mv.addObject("pi", pi);
			mv.addObject("af", af);
			mv.addObject("modeSet", modeSet);
			mv.setViewName("secondGoodBoard");
		} else {
			throw new BoardException("중고 게시판 조회 실패.");
		}

		return mv;
	}

	/*
	 * @RequestMapping("selectOne.bo") public ModelAndView
	 * selectOne(@RequestParam("sgId") int sgId, ModelAndView mv) {
	 * 
	 * int a = bService.viewCount(sgId);
	 * 
	 * Board board = bService.selectOne(sgId); Attachment at =
	 * bService.boardFileList(sgId);
	 * 
	 * if (board != null) { if (board.getB_Category().equals("A")) {
	 * mv.addObject("board", board).addObject("at",
	 * at).setViewName("auctionDetail"); } else { mv.addObject("board",
	 * board).addObject("at", at).setViewName("usedDetail"); } } else { throw new
	 * BoardException("게시글 읽기를 실패하였습니다."); }
	 * 
	 * return mv; }
	 */
	@RequestMapping("selectOne.bo")
	public ModelAndView selectOne(@RequestParam("sgId") int sgId, ModelAndView mv,
			@RequestParam(value = "auctionPrice", required = false) Integer price,
			@RequestParam(value = "userId", required = false) String userId) {
		// 라산이 조회수 카운트 기능
		int a = bService.viewCount(sgId);

		if (price != null && userId != null) {
			// 로그인상태 : 경매 입찰시
			AuctionHistory ah = new AuctionHistory();
			ah.setSg_Id(sgId);
			ah.setUser_Id(userId);
			ah.setA_Price(price);
			int result = bService.insertAuction(ah);

			if (result > 0) {
				// 입찰 성공시
				// 경매내역 조회하여 최고금액을 게시판에 적용하기
				int maxPrice = bService.auctionMaxPrice(sgId);

				if (maxPrice < 1) {
					throw new BoardException(sgId + "의 경매가 최신화에 실패하였습니다.");
				}
			} else {
				throw new BoardException("입찰 실패");
			}
		}

		Board board = bService.selectOne(sgId);
		Attachment at = bService.boardFileList(sgId);

		// 게시판 타입에 따른 뷰화면 전환
		if (board != null) {
			if (board.getB_Category().equals("A")) {
				mv.addObject("board", board).addObject("at", at).setViewName("auctionDetail");
			} else {
				mv.addObject("board", board).addObject("at", at).setViewName("usedDetail");
			}
		} else {
			throw new BoardException("게시글 읽기를 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("replyList.bo")
	public void replyList(HttpServletResponse response,int SG_ID) throws JsonIOException, IOException   {
		ArrayList<Reply> list= bService.selectReplyList(SG_ID);
		
		for(Reply r : list) {
			r.setREPLY_INFO(URLEncoder.encode(r.getREPLY_INFO(),"UTF-8"));
			r.setNICKNAME(URLEncoder.encode(r.getNICKNAME(),"UTF-8"));
		
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	

	
	
	@RequestMapping("addReply.bo")
	@ResponseBody
	public String addReply(Reply r,HttpSession session) {
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		String rWriter = loginUser.getId();
		
		r.setNICKNAME("testUser");
		r.setUSER_ID("testId");
		
		int result = bService.insertReply(r);
		
		if(result >0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록에 실패하였습니다.");
		}
	}

	@RequestMapping("boardupdateForm.bo")
	public ModelAndView boardUpdateForm(ModelAndView mv, @RequestParam("sgId") int sgId) {
		ArrayList<String> category = bService.category();
		Board board = bService.selectOne(sgId);
		Attachment at = bService.boardFileList(sgId);
		
		if (board != null) {
			if (board.getB_Category().equals("A")) {
				mv.addObject("board", board).addObject("at", at).addObject("category", category)
						.setViewName("auctionUpdateForm");
			} else {
				mv.addObject("board", board).addObject("at", at).addObject("category", category)
						.setViewName("usedUpdateForm");
			}
		} else {
			throw new BoardException("게시글 읽기를 실패하였습니다.");
		}
		return mv;
	}

	@RequestMapping("boardUpdate.bo")
	public ModelAndView boardUpdate(ModelAndView mv, @ModelAttribute Board b,
			@RequestParam("smImg") MultipartFile uploadFile, HttpServletRequest request, HttpServletResponse response) {
		if (b.getSG_DEAL().equals("DIRECT")) {
			b.setSG_DELIVERY("N");
		} else {
			b.setSG_AREA("");
		}
		
		int type=Integer.parseInt(request.getParameter("type"));

		Attachment atm = new Attachment();
		String renameFileName = "";

		if (uploadFile != null && !uploadFile.isEmpty()) {

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
		String root2 = request.getSession().getServletContext().getRealPath("resources") + "\\thumbnail/";
		File file;
		int result1 = bService.updateBoard(b,type);

		if (result1 > 0) {
			int result = 1;
			if (!uploadFile.isEmpty()) {
				result = bService.updateAttachment(atm);
			}
			if (result <= 0) {
				file = new File(root2 + renameFileName);
				System.out.println("파일 삭제 확인 : " + file.delete());
				throw new BoardException("썸네일 이미지 등록을 실패하였습니다.");
			}
		} else {
			file = new File(root2 + renameFileName);
			System.out.println("파일 삭제 확인 : " + file.delete());
			throw new BoardException("게시물 등록을 실패하였습니다.");
		}

		mv.addObject("sgId", b.getSG_ID()).setViewName("redirect:selectOne.bo");

		return mv;
	}

	@RequestMapping("insertF.bo")
	public ModelAndView insertF(ModelAndView mv, @RequestParam("type") int type) {
		ArrayList<String> category = bService.category();

		String fromname = "";
		if (type == 1) {
			fromname = "usedInsertForm";
		} else {
			fromname = "auctionInsertForm";
		}
		mv.addObject("category", category).setViewName(fromname);
		;
		return mv;
	}

	@RequestMapping("uInsert.bo")
	public String usedInsert(@ModelAttribute Board b, @RequestParam("smImg") MultipartFile uploadFile,
			HttpServletRequest request, HttpServletResponse response,@RequestParam("type") int type) {
		if (b.getSG_DELIVERY() == null) {
			b.setSG_DELIVERY("N");
		} else {
			b.setSG_AREA("");
		}
		System.out.println(b.getB_Category());

		Attachment atm = new Attachment();
//		b.setSG_PRICE(Integer.parseInt(b.getSG_PRICE()));
		String renameFileName = "";
		if (uploadFile != null && !uploadFile.isEmpty()) {

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
//		request.getParameter("imgNames");

		String[] allName = request.getParameter("imgNames").split(",");
		String[] saveName = request.getParameter("deletImg").split(",");
		String root = request.getSession().getServletContext().getRealPath("resources") + "\\textImgs/";
		String root2 = request.getSession().getServletContext().getRealPath("resources") + "\\thumbnail/";
		File file;
		for (int i = 0; i < saveName.length; i++) {
			for (int j = 0; j < allName.length; j++) {
				if (saveName[i].equals(allName[j])) {
					allName[j] = "N";
				}
			}
		}
		for (int i = 0; i < allName.length; i++) {
			if (!allName[i].equals("N")) {
				file = new File(root + allName[i]);
				System.out.println("파일 삭제 확인 : " + file.delete());
			}
		}

		int result1 = bService.insertBoard(b);

		if (result1 > 0) {
			int result = bService.insertAttachment(atm);

			if (result > 0) {
				return "redirect:home.do";
			} else {
				for (int i = 0; i < allName.length; i++) {
					if (!allName[i].equals("N")) {
						file = new File(root + allName[i]);
						System.out.println("파일 삭제 확인 : " + file.delete());
					}
				}
				file = new File(root2 + renameFileName);
				System.out.println("파일 삭제 확인 : " + file.delete());
				throw new BoardException("썸네일 이미지 등록을 실패하였습니다.");
			}
		} else {
			for (int i = 0; i < allName.length; i++) {
				if (!allName[i].equals("N")) {
					file = new File(root + allName[i]);
					System.out.println("파일 삭제 확인 : " + file.delete());
				}
			}
			file = new File(root2 + renameFileName);
			System.out.println("파일 삭제 확인 : " + file.delete());
			throw new BoardException("게시물 등록을 실패하였습니다.");
		}

	}

	public String saveFile(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\thumbnail";

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
	
	@RequestMapping("deleteBoard.bo")
	public String deleteBoard(@RequestParam("sgId") int sgId,@RequestParam("type") int type) {
		System.out.println("test");
		int result = bService.deleteBoard(sgId);
		if(result>0) {
			if(type==1) return "redirect:secondgoodList.bo";
			else return "redirect:auctionList.bo";
		}else {
			return "error";
		}
	}

}
