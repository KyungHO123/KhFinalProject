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

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import kr.kh.team3.pagination.PageMaker;
import kr.kh.team3.service.CommunityService;
import kr.kh.team3.service.HospitalService;
import kr.kh.team3.service.MemberService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommunityController {

	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private MemberService memberService;
	
	
	
	@GetMapping("/hospital/community")
	public String hospitalCommunity(Model model, HttpSession session) {
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		MemberVO member = memberService.getMemberInfo(user);
		ArrayList<PostVO> pList = communityService.getPostList(user);
		ArrayList<CommentVO> cList = communityService.getCommentList(user);
		ArrayList<RecommendVO> rList = communityService.getRecommendList(user);
		
		model.addAttribute("me", member);
		model.addAttribute("ho", hospital);
		model.addAttribute("pList", pList);
		model.addAttribute("cList", cList);
		model.addAttribute("rList", rList);
		return "/hospital/community";
	}
	
	//한 페이지에 3개의 페이지네이션이 필요하기 때문에 @RequestParam으로 각각 보내준다.
	//내 게시글
	@ResponseBody
	@PostMapping("/hospital/community/post")
	public Map<String, Object> hospitalCommunityPost(@RequestParam("page") int page, @RequestParam("site_id") String site_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page);
		cri.setPerPageNum(5);
		ArrayList<PostVO> pList = communityService.getCriPostList(cri, site_id);
		int totalCount = communityService.getPostTotalCount(cri,site_id);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		
		map.put("pList", pList);
		map.put("pm", pm);
		return map;
	}
	
	//내 댓글
	@ResponseBody
	@PostMapping("/hospital/community/comment")
	public Map<String, Object> hospitalCommunityComment(@RequestParam("page") int page, @RequestParam("site_id") String site_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page);
		cri.setPerPageNum(5);
		ArrayList<CommentVO> cList = communityService.getCriCommentList(cri, site_id);
		int totalCount = communityService.getCommentTotalCount(cri,site_id);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		
		map.put("cList", cList);
		map.put("pm", pm);
		return map;
	}
	
	//좋아요
	@ResponseBody
	@PostMapping("/hospital/community/recommend")
	public Map<String, Object> hospitalCommunityRecommend(
		@RequestParam("page") int page, @RequestParam("site_id") String site_id, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		Criteria cri = new Criteria(page);
		cri.setPerPageNum(5);
		ArrayList<RecommendVO> rList = communityService.getCriRecommendList(cri, site_id, user);
		int totalCount = communityService.getRecommendTotalCount(cri,site_id);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		
		map.put("rList", rList);
		map.put("pm", pm);
		return map;
	}
	
	//신고받은 게시글 삭제
	@GetMapping("/report/post/delete")
	public String ReportPostDelete(Model model, int po_num) {
		
		boolean res = communityService.reportPostDelete(po_num);
		
		if(res) {
			model.addAttribute("msg", "삭제에 성공하였습니다.");
			model.addAttribute("url", "/community");
		}else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/community");			
		}
		return "message";
	}
	//신고받은 댓글 삭제
	@GetMapping("/report/comment/delete")
	public String ReportCommentDelete(Model model, int co_num) {
		
		boolean res = communityService.reportCommentDelete(co_num);
		
		if(res) {
			model.addAttribute("msg", "삭제에 성공하였습니다.");
			model.addAttribute("url", "/community");
		}else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/community");			
		}
		return "message";
	}
}
