package com.kh.evening;

import java.util.ArrayList;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.evening.board.model.service.BoardServiceImp;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.common.Pageination;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
  
  @Autowired
  private BoardServiceImp bService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
	  
	  String modeSet = "recent";
	  String modeSet2= "CountList";
	  String boardCategory = null;
	  int currentPage = 1;
	  
	  int listCount = bService.getBoardListCount(boardCategory);
	  PageInfo pi = Pageination.getPageInfo(currentPage, listCount);
	  BoardMode bMode = new BoardMode(modeSet, boardCategory);
	  BoardMode bMode2 = new BoardMode(modeSet2, boardCategory);
	  
	  ArrayList<Board> alist = bService.boardList(pi, bMode);
	  ArrayList<Board> clist = bService.boardList(pi, bMode2);
	  ArrayList<Attachment> af = bService.boardFileList();
	  
	  model.addAttribute("alist", alist);
	  model.addAttribute("clist", clist);
	  model.addAttribute("af",af);
	  

		return "index";
	}
	
}
