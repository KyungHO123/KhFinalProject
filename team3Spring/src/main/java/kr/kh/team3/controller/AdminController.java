package kr.kh.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.ReservationVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import kr.kh.team3.pagination.PageMaker;
import kr.kh.team3.service.BoardService;
import kr.kh.team3.service.CommentService;
import kr.kh.team3.service.HospitalService;
import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.PostService;
import kr.kh.team3.service.ReservationScheduleService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class AdminController {
	
	@Autowired
	HospitalService hospitalService;
	
	/* 관리자 페이지 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	@Autowired
	ReservationScheduleService reservationScheduleService;
  
	@Autowired
	private MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	PostService postService;
	
	@Autowired
	CommentService commentService;
	
	@GetMapping("/admin/adminpage")
	public String adminpage(HttpSession session,Model model) {
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		if(!user.getSite_authority().equals("ADMIN")||user == null) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}else {
		return "/admin/adminpage";
		}
	}
	
	//병원 관리 페이지
	@GetMapping("/admin/hospital")
	public String adminHospital(HttpSession session,HospitalVO hospital,Model model,Criteria cri) {
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		if(!user.getSite_authority().equals("ADMIN")||user == null) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}
		//병원 전체 리스트 가져오기
		ArrayList<HospitalVO> hoList = hospitalService.hospitalList(cri);
		int totalCount = hospitalService.getHospitalCount(cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		//대기 병원 리스트 가져오기
		ArrayList<HospitalVO> hoWaitList = hospitalService.getWaitHoList();
		//신고 병원 리스트 가져오기
		ArrayList<SiteManagement> hoRpList = hospitalService.getRpHoList();
		model.addAttribute("hoWaitList",hoWaitList);
		model.addAttribute("hoRpList",hoRpList);
		model.addAttribute("hoList",hoList);
		model.addAttribute("pm",pm);
		return "/admin/hospital";
	}
	
	//대기 병원 관리 페이지
	@GetMapping("/admin/waitlist")
	public String adminWaitlist(HttpSession session,Model model) {
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		if(!user.getSite_authority().equals("ADMIN")||user == null) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}
		return "/admin/waitlist";
	}
	
	//대기 병원 리스트
	@ResponseBody
	@PostMapping("/admin/waitlist")
	public Map<String, Object> waitList(@RequestBody Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(3);
		ArrayList<HospitalVO> hospitalList = hospitalService.getWaitHospitalList(cri);
		int totalCount = hospitalService.getWHTotalCount(cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		map.put("list", hospitalList);
		map.put("pm", pm);
		return map;
	}
	
	//대기 병원 승인
	@ResponseBody
	@PostMapping("/admin/waitok")
	public Map<String, Object> waitOk(@RequestBody HospitalVO hospital){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = hospitalService.hospitalWaitOk(hospital);
		//대표 과목 추가
		boolean insertHsList = hospitalService.insertHoSub(hospital.getHo_id(), hospital.getHo_hs_num());

		map.put("res", res);
		map.put("insertHsList", insertHsList);
		return map;
	}
	
	//대기 병원 거절
	@ResponseBody
	@PostMapping("/admin/waitno")
	public Map<String, Object> waitNo(@RequestBody HospitalVO hospital){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = hospitalService.hospitalWaitNo(hospital);

		map.put("res", res);
		return map;
	}
	
	//신고 병원 관리 페이지
	@GetMapping("/admin/reportlist")
	public String adminReportlist(HttpSession session,Model model) {
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		if(!user.getSite_authority().equals("ADMIN")||user == null) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}
		//대기 병원 리스트 가져오기
		return "/admin/reportlist";
	}
	
	//신고 병원 리스트
	@ResponseBody
	@PostMapping("/admin/reportlist")
	public Map<String, Object> reportList(@RequestBody Criteria cri){
		Map<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(3);
		ArrayList<SiteManagement> hospitalList = hospitalService.getReportHospitalList(cri);
		int totalCount = hospitalService.getRHTotalCount(cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		map.put("list", hospitalList);
		map.put("pm", pm);
		return map;
	}
	
	//신고 병원 정지
	@ResponseBody
	@PostMapping("/admin/hospitalstop")
	public Map<String, Object> hospitalStop(@RequestBody ReportVO report){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = hospitalService.hospitalStop(report);

		map.put("res", res);
		return map;
	}
	
	//신고 병원 탈퇴
	@ResponseBody
	@PostMapping("/admin/hospitalout")
	public Map<String, Object> hospitalOut(@RequestBody HospitalVO hospital){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = hospitalService.hospitalOut(hospital);

		map.put("res", res);
		return map;
	}
	
	//회원 관리 메인 페이지("이용중" 전체 회원 리스트)
	@GetMapping("/admin/member/main")
	public String memberList(Model model, MemberVO member, LandVO land, Criteria cri,HttpSession session) {
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		if(!user.getSite_authority().equals("ADMIN")||user == null) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}
		cri.setPerPageNum(3);
		ArrayList<MemberVO> list = memberService.getMemberList(cri);
		int totalCount = memberService.getMemberTotalCount(cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		//신고 회원 리스트 가져오기
		ArrayList<ReportVO> meRpList = memberService.getMeRpList();

		model.addAttribute("meRpList",meRpList);
		model.addAttribute("list", list);
		model.addAttribute("pm", pm);
		
		return "/admin/member/main";
	}
	
	//신고 회원 관리 페이지
	@GetMapping("/admin/member/report")
    public String adminMeReport(HttpSession session,Model model) {
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		if(!user.getSite_authority().equals("ADMIN") || user == null || user.getSite_id() == null) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}

		return "/admin/member/report";
    }
	
	//신고 회원 관리 리스트
	@ResponseBody
	@PostMapping("/admin/member/report")
	public Map<String, Object> adminReportPost(@RequestBody Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();		
		cri.setPerPageNum(3);
		ArrayList<SiteManagement> list = memberService.getReportMemberList(cri);
		int totalCount = memberService.getReportMemberTotalCount(cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		
		map.put("list", list);
		map.put("pm", pm);
		return map;
	}
	
	//신고 회원 관리 - 탈퇴
	@ResponseBody
	@PostMapping("/admin/member/delete")
	public Map<String, Object> memberDelete(@RequestBody MemberVO member) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.deleteMember(member);
		map.put("result", res);
		return map;
	}
	
	//신고 회원 관리 - 정지(댓글 수정)
	@ResponseBody
	@PostMapping("/admin/member/stop")
	public Map<String, Object> memberStop(@RequestBody ReportVO report) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.stopMember(report);
		map.put("result", res);
		return map;
	}
	
	//게시판리스트를 보여주기 위한 메서드
		@GetMapping("/community")
		public String board(Model model,HttpSession session) {
			SiteManagement user = (SiteManagement)session.getAttribute("user");
			if(!user.getSite_authority().equals("ADMIN")||user == null) {
				model.addAttribute("msg","접근할 수 없는 페이지입니다.");
				model.addAttribute("url","/");
				return "message";
			}
			ArrayList<BoardVO> list = boardService.getBoardList();
			model.addAttribute("list", list);
			return "/community/community";
		}
		
		//수정 페이지를 보여주기 위한 메서드
		@GetMapping("/community/insert")
		public String boardInsert(Model model,HttpSession session) {
			SiteManagement user = (SiteManagement)session.getAttribute("user");
			if(!user.getSite_authority().equals("ADMIN")||user == null) {
				model.addAttribute("msg","접근할 수 없는 페이지입니다.");
				model.addAttribute("url","/");
				return "message";
			}
			ArrayList<BoardVO> list = boardService.getBoardList();
			model.addAttribute("list", list);
			return "/community/communityinsert";
		}
		
		//게시판을 추가 위한 메서드
		@PostMapping("/community/insert")
		public String boardInsertPost(Model model, String board) {
			ArrayList<BoardVO> list = boardService.getBoardList();
			
			boolean res = boardService.insertBoard(list, board);
			if (res) {
				model.addAttribute("msg","게시판 등록을 완료했습니다.");
				model.addAttribute("url","/community");
			}else {
				model.addAttribute("msg","게시판 등록에 실패 했습니다.");
				model.addAttribute("url","/community/insert");
			}
			return "message";
		}
		
		
		//게시판 수정 페이지를 보여주기 위한 메서드
		@GetMapping("/community/update")
		public String boardUpdate(Model model, int bo_num,HttpSession session) {
			SiteManagement user = (SiteManagement)session.getAttribute("user");
			if(!user.getSite_authority().equals("ADMIN")||user == null) {
				model.addAttribute("msg","접근할 수 없는 페이지입니다.");
				model.addAttribute("url","/");
				return "message";
			}
			BoardVO board = boardService.getBoard(bo_num);
			model.addAttribute("board", board);
			return "/community/communityupdate";
		}
		
		//게시판 수정을 위한 메서드
		@PostMapping("/community/update")
		public String boardUpdatePost(Model model, BoardVO boardVO, String new_BoardName) {
			boolean res = boardService.updateBoard(boardVO, new_BoardName);
			if (res) {
				model.addAttribute("msg","게시판 수정을 완료했습니다.");
				model.addAttribute("url","/community");
			}else {
				model.addAttribute("msg","게시판 수정에 실패 했습니다.");
				model.addAttribute("url","/community/update");
			}
			return "message";
		}
		
		//게시판 삭제를 위한 메서드
		@GetMapping("/community/delete")
		public String boardDelete(Model model, int bo_num) {
			boolean res = boardService.deleteBoard(bo_num);
			if (res) {
				model.addAttribute("msg","게시판 삭제를 완료했습니다.");
				model.addAttribute("url","/community");
			}else {
				model.addAttribute("msg","게시판 삭제에 실패 했습니다.");
				model.addAttribute("url","/community");
			}
			return "message";
		}
		
		// ======================== 게시판 관리 끝 ==========================
		
		
		// ======================== 게시글 관리 시작 ==========================
		@ResponseBody
		@GetMapping("/post")
		public Map<String, Object> postPost(@RequestParam("bo_num") int bo_num, @RequestParam("page") int page) {
			Map<String, Object> map = new HashMap<String, Object>();
			Criteria cri = new Criteria(page, 2);
			int totalCount = postService.getPostCount(cri, bo_num);
			ArrayList<PostVO> list = postService.getPostList(cri, bo_num);
			PageMaker pm = new PageMaker(3, cri, totalCount);
			map.put("list", list);
			map.put("pm", pm);
			return map;
		}
		
		@GetMapping("/post/delete")
		public String postdelete(Model model, int po_bo_num, String po_num) {
			int po_num1 = Integer.parseInt(po_num);
			PostVO post = new PostVO(po_num1, po_bo_num);
			boolean res = postService.deletePost(post);
			if (res) {
				model.addAttribute("msg","게시글 삭제를 완료했습니다.");
				model.addAttribute("url","/community");
			}else {
				model.addAttribute("msg","게시글 삭제에 실패 했습니다.");
				model.addAttribute("url","/community");
			}
			return "message";
		}
		
		@ResponseBody
		@PostMapping("/comment")
		public Map<String, Object> CommentPost(@RequestParam("po_num") int po_num, @RequestParam("page") int page) {
			Map<String, Object> map = new HashMap<String, Object>();
			Criteria cri = new Criteria(page, 2);
			int totalCount = commentService.getCommentCount(cri, po_num);
			ArrayList<CommentVO> list = commentService.getCommentByPostList(cri, po_num);
			PageMaker pm = new PageMaker(3, cri, totalCount);
			map.put("list", list);
			map.put("pm", pm);
			return map;
		}
		
		@ResponseBody
		@PostMapping("/commentno")
		public Map<String, Object> CommentNoPost(@RequestParam("po_num") int po_num, @RequestParam("page") int page) {
			Map<String, Object> map = new HashMap<String, Object>();
			Criteria cri = new Criteria(page, 2);
			int totalCount = commentService.getCommentNoCount(cri, po_num);
			ArrayList<CommentVO> list = commentService.getCommentNoByPostList(cri, po_num);
			PageMaker pm = new PageMaker(3, cri, totalCount);
			map.put("list", list);
			map.put("pm", pm);
			return map;
		}
		
		@GetMapping("/comment/delete")
		public String CommentDelete(Model model, int co_num) {
			CommentVO comment = new CommentVO(co_num);
			boolean res = commentService.deleteComment(comment);
			if (res) {
				model.addAttribute("msg","댓글 삭제를 완료했습니다.");
				model.addAttribute("url","/community");
			}else {
				model.addAttribute("msg","댓글 삭제에 실패 했습니다.");
				model.addAttribute("url","/community");
			}
			return "message";
		}
		
		@ResponseBody
		@GetMapping("/post/declaration")
		public Map<String, Object> postnodeclaration(@RequestParam("bo_num") int bo_num, @RequestParam("page") int page) {
			Map<String, Object> map = new HashMap<String, Object>();
			Criteria cri = new Criteria(page, 2);
			int totalCount = postService.getPostNoCount(cri, bo_num);
			ArrayList<PostVO> list = postService.getPostNoList(cri, bo_num);
			PageMaker pm = new PageMaker(3, cri, totalCount);
			map.put("list", list);
			map.put("pm", pm);
			return map;
		}
		// ======================== 게시글 관리 끝 ==========================
		
		//메출 확인
		@GetMapping("/sales")
		public String sales(Model model, HttpSession session) {
			Map<String, Object> map = new HashMap<String, Object>();
			SiteManagement user = (SiteManagement) session.getAttribute("user");
			if(!user.getSite_authority().equals("ADMIN")) {
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "/");
				return "message";
			}
			
			ArrayList<ReservationVO> list = reservationScheduleService.getAllReservationScheduleList();
			System.out.println("aaaaaaaaaaaaaaaaaaaa");
			log.info(list);
			//model.addAttribute("list", list);
			
			return "/admin/sales";
		}
		
		
}
