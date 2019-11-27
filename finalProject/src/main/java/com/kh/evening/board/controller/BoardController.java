package com.kh.evening.board.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.evening.board.model.exception.BoardException;
import com.kh.evening.board.model.service.BoardService;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.AuctionHistory;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.GoodLike;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.board.model.vo.Reply;
import com.kh.evening.common.Pageination;
import com.kh.evening.member.model.service.MemberService;
import com.kh.evening.member.model.vo.Member;

import oracle.sql.DATE;

/**
 * @author KimHyunWoo
 *
 */
@SessionAttributes("loginUser")
@Controller
public class BoardController {

  @Autowired
  private BoardService bService;
  
  @Autowired
  private MemberService mService;

  @RequestMapping("auctionList.bo")
  public ModelAndView auctionList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv, @RequestParam(value="mode", required=false) String mode) {
    int currentPage = 1;
    // 페이징 : 현재 페이지 설정
    if (page != null) {
      currentPage = page;
    }
    
    // 정렬 순서 설정 : 기본값 recent(최신순)
    String modeSet = "recent";
    if (mode != null) {
      modeSet = mode;
    }
    
    // 게시물 종류 선택
    String boardCategory = "A";
    int listCount = bService.getBoardListCount(boardCategory);
    PageInfo pi = Pageination.getPageInfo(currentPage, listCount);

    // 정렬순서와 게시물 종류 설정 (동적 쿼리)
    BoardMode bMode = new BoardMode(modeSet, boardCategory);
    
    // 경매 리스트
    ArrayList<Board> alist = bService.boardList(pi,bMode);
    // 첨부파일 리스트
    ArrayList<Attachment> af = bService.boardFileList();
    
    // 페이징 처리 되지않은 모든 리스트 조회용 필요(쿠키 확인용: 최근 본 상품)
    String bCategory = null;
    ArrayList<Board> allList = bService.boardAllList(bCategory);
    
    if (alist != null) {
      mv.addObject("alist", alist);
      mv.addObject("pi",pi);
      mv.addObject("modeSet",modeSet);
      mv.addObject("af", af);
      mv.addObject("allList",allList);
      mv.setViewName("auctionBoard");
    } else {
      throw new BoardException("경매 게시판 조회 실패.");
    }

    return mv;
  } 
  
  @RequestMapping("secondgoodList.bo")
  public ModelAndView secondGoodList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, @RequestParam(value="mode", required=false) String mode) {
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

    ArrayList<Board> alist = bService.boardList(pi,bMode);
    ArrayList<Attachment> af = bService.boardFileList();
    
    // 페이징 처리 되지않은 모든 리스트 조회용 필요
    String bCategory = null;
    ArrayList<Board> allList = bService.boardAllList(bCategory);
    
    if (alist != null) {
      mv.addObject("alist", alist);
      mv.addObject("pi",pi);
      mv.addObject("af", af);
      mv.addObject("modeSet", modeSet);
      mv.addObject("allList",allList);
      mv.setViewName("secondGoodBoard");
    } else {
      throw new BoardException("중고 게시판 조회 실패.");
    }
    
    return mv;
  }
  
  @RequestMapping("selectOne.bo")
  public ModelAndView selectOne(@RequestParam("sgId") int sgId,@RequestParam(value="page",required=false) Integer page,@RequestParam(value="mode",required=false)String mode,ModelAndView mv, @RequestParam(value="auctionPrice", required=false) Integer price,@RequestParam(value="userId",required=false) String userId) {
      // 라산 : 조회수 카운트 기능
     int a = bService.viewCount(sgId);
     
     if(price != null && userId != null) {
       // 로그인상태 : 경매 입찰시
       AuctionHistory ah = new AuctionHistory();
       ah.setSg_Id(sgId);
       ah.setUser_Id(userId);
       ah.setA_Price(price);
       int result = bService.insertAuction(ah);
       
       if( result > 0) {
         // 입찰 성공시
         // 경매내역 조회하여 최고금액을 게시판에 적용하기
         int maxPrice = bService.auctionMaxPrice(sgId);
         
         if(maxPrice < 1) {
           throw new BoardException(sgId+"의 경매가 최신화에 실패하였습니다.");
         }
       }else {
         throw new BoardException("입찰 실패");
       }
     }
     
     Board board = bService.selectOne(sgId);
     Attachment at = bService.boardFileList(sgId);
     
     // 게시판 타입에 따른 뷰화면 전환
     if(board != null) {
       if(board.getB_Category().equals("A")) {
         if(mode != null) {
           mv.addObject("page",page).addObject("mode",mode);
         }
         mv.addObject("board",board).addObject("at",at).addObject("pi",new PageInfo()).setViewName("auctionDetail");
       }else {
         mv.addObject("board",board).addObject("at",at).addObject("pi",new PageInfo()).setViewName("usedDetail");
       }
     }else {
        throw new BoardException("게시글 읽기를 실패하였습니다.");
     }
     
     return mv;
  }
	
	@RequestMapping("replyList.bo")
	public void replyList(@RequestParam(value="page",required=false) Integer page,HttpServletResponse response,int SG_ID) throws JsonIOException, IOException   {
		int currentPage = 1;
	    if (page != null) {
	      currentPage = page;
	    }
	    
	    int listCount = bService.getReplyListCount(SG_ID);
	    
	    PageInfo pi = Pageination.getReplyInfo(currentPage, listCount);
	    
	    ArrayList<Reply> list= bService.selectReplyList(SG_ID,pi);
		
		for(Reply r : list) {
			r.setREPLY_INFO(URLEncoder.encode(r.getREPLY_INFO(),"UTF-8"));
			r.setNICKNAME(URLEncoder.encode(r.getNICKNAME(),"UTF-8"));
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
	    if (list != null) {
	    	result.put("pi", pi);
	    	result.put("rlist", list);
	    }
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		gson.toJson(result,response.getWriter());
	}
	
	
	@RequestMapping("addReply.bo")
	@ResponseBody
	public String addReply(Reply r,HttpSession session,HttpServletRequest request) {
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		String rWriter = loginUser.getId();
		int result=0;
		boolean add = Boolean.parseBoolean(request.getParameter("add"));
		
		result= bService.insertReply(r,add);			
		
		if(result >0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록에 실패하였습니다.");
		}
	}
	@RequestMapping("replyUpdate.bo")
	@ResponseBody
	public String replyUpdate(Reply r,HttpSession session) {
		int result=bService.replyUpdate(r);
		if(result >0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록에 실패하였습니다.");
		}
	}
	@RequestMapping("deleteReply.bo")
	@ResponseBody
	public String deleteReply(Reply r,HttpSession session) {
		int result=bService.deleteReply(r,true);
		
		if(result >0) {
			return "success";
		}else {
			throw new BoardException("댓글 등록에 실패하였습니다.");
		}
	}
	@RequestMapping("deleteReplyAdd.bo")
	@ResponseBody
	public String deleteReplyAdd(Reply r,HttpSession session) {
		int result=bService.deleteReply(r,false);
		
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
	
	@RequestMapping("selectLike.bo")
	@ResponseBody
	public int selectLike(@RequestParam("user_Id") String userId, @RequestParam("sgId") int sgId,@RequestParam("likeCheck") Boolean Check) {
	  // 리턴할 값 더미
	  GoodLike num = new GoodLike();
	  num.setGl_check(0);
	  
	  // 좋아요 있는지 확인 ( 유저 아이디로 전체 조회 )
	  ArrayList<GoodLike> likeList = bService.selectGoodLike(userId);
	  
	  GoodLike user = new GoodLike();
	  user.setUser_Id(userId);
	  user.setSg_id(sgId);
	  
	  // 좋아요가 안되어있을경우
	  if(Check == false) {
	    int result = bService.insertGoodLike(user);
	    
	    if(result > 0) {
	      // 게시판 테이블도 좋아요 반영
	      user.setGl_check(1);
	      int boardLike = bService.updateBoardLike(user);
	      if(boardLike > 0) {
	        num.setGl_check(1);
	      }else {
	        throw new BoardException("게시판 좋아요 최신화 실패");
	      }
	    }else {
	      throw new BoardException("좋아요 추가 실패");
	    }
	  }else {
	    for(GoodLike gl: likeList) {
	      if(gl.getSg_id() == sgId) {
	        // 있으면 수정
	        if(gl.getGl_check() == 1) {
	          gl.setGl_check(0);
	          user.setGl_check(0);
	        }else {
	          gl.setGl_check(1);
	          user.setGl_check(1);
	        }
	        // 좋아요값을 반대로 넣기(DB에 업데이트하는 과정)
	        int changeCheck = bService.updateGoodLike(gl);
	        if(changeCheck > 0) {
	          // 성공시 게시판에도 좋아요 갯수 반영
	          int boardLike = bService.updateBoardLike(user);
	          if(boardLike > 0) {
	            num.setGl_check(gl.getGl_check());
	          }else {
	            throw new BoardException("게시판 좋아요 최신화 실패");
	          }
	        }else {
	          throw new BoardException("좋아요 변경 실패");
	        }
	      }
	    }
	  }
	  return num.getGl_check();
	}
	
	@RequestMapping("selectLikeCheck.bo")
	@ResponseBody
	public HashMap<String, Object> selectLikeCheck(@RequestParam(value="user_Id", required=false) String userId, @RequestParam(value="sgId") int sgId) {
	  // 게시판 접속시 좋아요 체크상태 여부 확인
	  ArrayList<GoodLike> list = bService.selectGoodLike(userId);
	  
	  HashMap<String,Object> rlist = new HashMap<String, Object>();
	  rlist.put("result", 0);
	  rlist.put("check", false);
	  
	  if(list.size() < 1) {
	    return rlist;
	  }
	  
	  for(GoodLike gl : list) {
	    if(gl.getSg_id() == sgId) {
	      rlist.put("result", gl.getGl_check());
	      rlist.put("check", true);
	      return rlist;
	    }
	  }
	  
	  return rlist;
	}
	
	
	@RequestMapping("createCookie.bo")
	public void createCookie(@RequestParam(value="user_Id", required=false) String userId,@RequestParam(value="sgId") int sgId, HttpServletResponse response) {
	  
	  if(userId.length() > 0) {
	    String cookieName = "history_"+userId+"_"+sgId;
	    String cookieValue = Integer.toString(sgId);
	    Cookie cookie = new Cookie(cookieName,cookieValue);
	    cookie.setMaxAge(60*5);
	    response.addCookie(cookie);
	  }
	}


	@RequestMapping("uInsert.bo")
	public String usedInsert(@ModelAttribute Board b, @RequestParam("smImg") MultipartFile uploadFile,
			HttpServletRequest request, HttpServletResponse response,@RequestParam("aDay") int aDay,@RequestParam("type") int type) {
		if (b.getSG_DELIVERY() == null) {
			b.setSG_DELIVERY("N");
		} else {
			b.setSG_AREA("");
		}
		Calendar time = new GregorianCalendar();
		time.add(Calendar.DATE, +aDay);
		Date date = new Date(time.getTimeInMillis());
		b.setSG_END_DATE(date);
		
		
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
			  if(type==1)return "redirect:secondgoodList.bo";
			  else return "redirect:auctionList.bo";
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
	public String deleteBoard(@RequestParam("sgId") int sgId,@RequestParam("type") int type,Model model) {
		int result = bService.deleteBoard(sgId);
		int updatePenalty = 0;
		if(result>0) {
			if(type==1) return "redirect:secondgoodList.bo";
			else {
			  Member user = (Member)model.getAttribute("loginUser");
			  int penaltyPoint = user.getPenalty_point();
			  
			  if(penaltyPoint == 2) {
			    user.setRank_code("E");
			    user.setPenalty_point(0);
			    user.setPenalty_stack(1);
			    updatePenalty = mService.updatePenaltyPoint(user);
			  }else {
			    user.setPenalty_point(user.getPenalty_point()+1);
			    updatePenalty = mService.updatePenaltyPoint(user);
			  }
			  
			  if(updatePenalty > 0) {
			    Member loginUser = mService.memberLogin(user);
			    model.addAttribute("loginUser",loginUser);
			  }
			    return "redirect:auctionList.bo";
			}
		}else {
			return "error";
		}
	}

}
