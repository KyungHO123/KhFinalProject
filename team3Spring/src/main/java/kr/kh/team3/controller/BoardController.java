package kr.kh.team3.controller;

import java.util.ArrayList;


import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.FileVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import kr.kh.team3.pagination.PageMaker;
import kr.kh.team3.service.BoardService;
import kr.kh.team3.service.HospitalService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
//게시판 컨트롤러
public class BoardController {

	/*
	 * 관리자 전용 컨트롤러 게시판 관리용 게시판 리스트 부터 추가 삭제 수정 순으로 기능 구현 전부다 비동기로 진행 수업때 댓글 비동기 한거
	 * 참고하기
	 * 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	@Autowired
	private BoardService boardService;

	@Autowired
	private HospitalService hospitalService;

	@GetMapping("/board/all")
	public String boardAll(HttpSession session, Model model) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}
		ArrayList<BoardVO> boList = boardService.getAllBoardList();
		ArrayList<PostVO> poList = boardService.getAllPostList();
		model.addAttribute("boList", boList);
		model.addAttribute("poList", poList);
		return "/board/all";
	}

	@GetMapping("/board/list")
	public String boardList(HttpSession session,Model model, Criteria cri, int bo_num) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}
		String bo_name = boardService.getBoardName(bo_num);
		cri.setPerPageNum(10);
		ArrayList<PostVO> poList = boardService.getPostList(bo_num, cri);
		int totalCount = boardService.getPostListCount(bo_num, cri);
		PageMaker pm = new PageMaker(10, cri, totalCount);
		model.addAttribute("bo_num", bo_num);
		model.addAttribute("bo_title", bo_name);
		model.addAttribute("poList", poList);
		model.addAttribute("pm", pm);
		return "/board/list";
	}

	//회원 커뮤니티 관리
	@GetMapping("/member/community")
	public String memberCommunity(HttpSession session,Model model, Criteria cri, String id) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}	
		ArrayList<PostVO> poList = boardService.getUserPostList(id,cri);
		String site_authority = boardService.getUserAuthority(id);
		HospitalDetailVO hd = hospitalService.getHospitalDetail(id);
		for(PostVO post : poList) {
			model.addAttribute("po_num",post.getPo_num());
		}
		model.addAttribute("po_id", id);
		model.addAttribute("hd", hd);
		model.addAttribute("site_authority", site_authority);

		return "/member/community";
	}
	
	@GetMapping("/board/userpost")
	public String boardUser(HttpSession session, Model model, Criteria cri, String po_id) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}	
		ArrayList<PostVO> poList = boardService.getUserPostList(po_id,cri);
		String site_authority = boardService.getUserAuthority(po_id);
		HospitalDetailVO hd = hospitalService.getHospitalDetail(po_id);
		for(PostVO post : poList) {
			model.addAttribute("po_num",post.getPo_num());
		}
		model.addAttribute("po_id", po_id);
		model.addAttribute("hd", hd);
		model.addAttribute("site_authority", site_authority);

		return "/board/userpost";
	}


	@ResponseBody
	@PostMapping("/board/userpost")
	public Map<String, Object> boardUserPost(@RequestParam("page") int page, @RequestParam("type") String type,
			@RequestParam("search") String search, @RequestParam("po_id") String po_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page, 5, type, search);
		ArrayList<PostVO> poList = boardService.getUserPostList(po_id, cri);
		int totalCount = boardService.getUserPostListCount(po_id, cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		map.put("poList", poList);
		map.put("pm", pm);
		return map;
	}

	@ResponseBody
	@PostMapping("/board/usercmt")
	public Map<String, Object> boardUserComment(@RequestParam("page") int page, @RequestParam("type") String type,
			@RequestParam("search") String search, @RequestParam("po_id") String po_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page, 5, type, search);
		ArrayList<PostVO> coList = boardService.getUserCmtList(po_id, cri);
		int totalCount = boardService.getUserCmtListCount(po_id, cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		map.put("coList", coList);
		map.put("pm", pm);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/board/userrec")
	public Map<String, Object> boardUserRec(@RequestParam("page") int page, @RequestParam("type") String type,
			@RequestParam("search") String search, @RequestParam("po_id") String po_id, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page, 5, type, search);
		ArrayList<PostVO> recList = boardService.getUserRecList(user.getSite_num(), cri);
		log.info("sdfa;ㅏㅣㅁ러마ㅣㅓㄻ"+recList);
		int totalCount = boardService.getUserRecListCount(user.getSite_num(), cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		map.put("recList", recList);
		map.put("pm", pm);
		return map;
	}

	@GetMapping("/board/insert")
	public String boardInsertGet(HttpSession session,Model model, int bo_num) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}

		model.addAttribute("bo_num", bo_num);
		return "/board/insert";
	}

	@PostMapping("/board/insert")
	public String boardInsertPost(Model model, PostVO post, MultipartFile[] files, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}
		boolean res = boardService.insertPost(user, post, files);
		if (!res) {
			model.addAttribute("msg", "게시글을 등록하지 못했습니다.");
			model.addAttribute("url", "/board/insert?bo_num=" + post.getPo_bo_num());
		} else {
			model.addAttribute("msg", "게시글이 등록 되었습니다.");
			model.addAttribute("url", "/board/list?bo_num=" + post.getPo_bo_num()); // 임시 구현 완료되면 디테일로 url변경
		}
		return "message";
	}

	@GetMapping("/board/detail")
	public String boardDetailGet(Model model, HttpSession session, int po_num) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}
		boardService.updateView(po_num);
		PostVO post = boardService.getPostDetail(po_num);
		ArrayList<FileVO> fileList = boardService.getFileList(po_num);
		model.addAttribute("fileList", fileList);
		model.addAttribute("post", post);

		return "/board/detail";
	}

	// 게시글 삭제
	@GetMapping("/board/delete")
	public String boardDelete(Model model, PostVO post, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}
		PostVO delPost = boardService.getPost(post.getPo_num());
		int bo_num = delPost.getPo_bo_num();
		boolean res = boardService.deletePost(post.getPo_num(), user);
		if (res) {
			model.addAttribute("url", "/board/list?bo_num=" + bo_num);
			model.addAttribute("msg", "게시글을 삭제했습니다.");
		} else {
			model.addAttribute("url", "/board/detail?po_num=" + post.getPo_num());
			model.addAttribute("msg", "게시글을 삭제하지 못했습니다.");
		}

		return "message";
	}

	// 게시글 슈정
	@GetMapping("/board/update")
	public String getBoardUpdate(Model model, PostVO post, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}
		ArrayList<BoardVO> boardList = boardService.getAllBoardList();
		PostVO myPost = boardService.getPostDetail(post.getPo_num());
		ArrayList<FileVO> fileList = boardService.getFileList(post.getPo_num());
		model.addAttribute("fileList", fileList);
		model.addAttribute("post", myPost);
		model.addAttribute("board", boardList);
		return "/board/update";
	}

	@PostMapping("/board/update")
	public String postBoardUpdate(Model model, PostVO post,MultipartFile[] file, int[] delNums,
			HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = boardService.updateMyPost(post, user, file, delNums);
		if (res) {
			model.addAttribute("url", "/board/detail?po_num=" + post.getPo_num());
			model.addAttribute("msg", "게시글을 수정했습니다.");
		} else {
			model.addAttribute("url", "/board/update?po_num=" + post.getPo_num());
			model.addAttribute("msg", "게시글을 수정하지 못했습니다.");
		}


		return "message";
	}

	@ResponseBody
	@PostMapping("/recommend/check")
	public Map<String, Object> recommendCheck(@RequestBody RecommendVO recommend, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		int res = boardService.recommend(recommend, user);
		map.put("result", res);
		return map;
	}

	@ResponseBody
	@PostMapping("/recommend")
	public Map<String, Object> recommend(@RequestParam("num") int num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		int state = boardService.getUserRecommend(num, user);
		PostVO post = boardService.getPost(num);
		map.put("state", state);
		map.put("post", post);
		return map;
	}

	@ResponseBody
	@PostMapping("/report/check")
	public Map<String, Object> reportCheck(@RequestParam("rp_table") String rp_table,
			@RequestParam("rp_target_id") String rp_target_id, @RequestParam("rp_name") String rp_name,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		int rp_target = boardService.getRpTarget(rp_target_id);
		ReportVO report = new ReportVO(rp_target, rp_name, rp_table);
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = boardService.report(report, user);
		map.put("result", res);
		return map;
	}

 

	@ResponseBody
	@PostMapping("/report/community")
	public Map<String, Object> reportPost(@RequestParam("rp_table") String rp_table,
			@RequestParam("rp_target") int rp_target, @RequestParam("rp_name") String rp_name, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		ReportVO report = new ReportVO(rp_target, rp_name, rp_table);
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = boardService.report(report, user);
		map.put("result", res);
		return map;
	}

	@ResponseBody
	@PostMapping("/report/comment")
	public Map<String, Object> reportComment(@RequestParam("rp_table") String rp_table,
			@RequestParam("rp_target") int rp_target, @RequestParam("rp_name") String rp_name, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		ReportVO report = new ReportVO(rp_target, rp_name, rp_table);
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = boardService.report(report, user);
		map.put("result", res);
		return map;
	}

}
