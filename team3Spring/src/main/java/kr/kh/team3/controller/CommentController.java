package kr.kh.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import kr.kh.team3.pagination.PageMaker;
import kr.kh.team3.service.CommentService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommentController {

	/*
	 * 댓글 리스트 부터 추가 삭제 수정 순으로 기능 구현 전부다 비동기로 진행 수업때 댓글 비동기 한거 참고하기
	 * 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	@Autowired
	CommentService commentService;

	@ResponseBody
	@PostMapping("/comment/list")
	public Map<String, Object> commentList(@RequestBody Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(10);
		ArrayList<CommentVO> commentList = commentService.getCommentList(cri);
		int totalCount = commentService.getTotalCount(cri);
		PageMaker pm = new PageMaker(10, cri, totalCount);
		map.put("commentList", commentList);
		map.put("pm", pm);
		return map;
	}

	@ResponseBody
	@PostMapping("/comment/insert")
	public Map<String, Object> commentInsert(@RequestBody CommentVO comment, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = commentService.insertComment(comment, user);
		map.put("result", res);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/comment/delete")
	public Map<String, Object> commentDelete(@RequestBody CommentVO comment, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = commentService.deleteComment(comment, user);
		map.put("result", res);
		return map;
	}
	
	
	@ResponseBody
	@PostMapping("/comment/update")
	public Map<String, Object> commentUpdate(@RequestBody CommentVO comment, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = commentService.updateComment(comment, user);
		map.put("result", res);
		return map;
	}
	
}
