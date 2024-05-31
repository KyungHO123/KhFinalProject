package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface CommentService {

	int getCommentCount(Criteria cri, int po_num);

	ArrayList<CommentVO> getCommentByPostList(Criteria cri, int po_num);

	boolean deleteComment(CommentVO comment);

	int getCommentNoCount(Criteria cri, int po_num);

	ArrayList<CommentVO> getCommentNoByPostList(Criteria cri, int po_num);

	ArrayList<CommentVO> getCommentList(Criteria cri);

	int getTotalCount(Criteria cri);

	boolean insertComment(CommentVO comment, SiteManagement user);

	boolean deleteComment(CommentVO comment, SiteManagement user);

	boolean updateComment(CommentVO comment, SiteManagement user);

}
