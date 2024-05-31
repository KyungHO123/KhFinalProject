package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.CommentDAO;
import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

@Service
@Component
public class CommentServiceImp implements CommentService {
	
	@Autowired
	CommentDAO commentDao;
	
	private boolean checkString(String str) {
		return str != null && str.length() != 0;
	}

	@Override
	public ArrayList<CommentVO> getCommentByPostList(Criteria cri, int po_num) {
		if(cri == null) {
			cri = new Criteria();
		}
		return commentDao.selectCommentList(cri, po_num);
	}
	
	@Override
	public int getCommentCount(Criteria cri, int po_num) {
		if(cri == null) {
			cri = new Criteria();
		}
		return commentDao.selectCommentTotalCount(cri, po_num);
	}

	@Override
	public boolean deleteComment(CommentVO comment) {
		
		if(comment == null) {
			return false;
		}
		return commentDao.deleteComment(comment);
	}

	@Override
	public int getCommentNoCount(Criteria cri, int po_num) {
		if(cri == null) {
			cri = new Criteria();
		}
		return commentDao.selectCommentNoTotalCount(cri, po_num);
	}

	@Override
	public ArrayList<CommentVO> getCommentNoByPostList(Criteria cri, int po_num) {
		if(cri == null) {
			cri = new Criteria();
		}
		return commentDao.selectCommentNoList(cri, po_num);
	}

	@Override
	public ArrayList<CommentVO> getCommentList(Criteria cri) {
		if (cri == null) {
			return null;
		}
		return commentDao.selectAjaxCommentList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		if (cri == null) {
			return 0;
		}
		return commentDao.selectTotalCount(cri);
	}

	@Override
	public boolean insertComment(CommentVO comment, SiteManagement user) {
		if (user == null )
			return false;
		if (comment == null || !checkString(comment.getCo_content()))
			return false;
		// 댓글 작성자로 로그인한 회원 아이디를 넣어줌
		comment.setCo_mg_num(user.getSite_num());
		//post 테이블에서 po_co_count 수 업데이트
		commentDao.updatePostCoCountUp(comment);
		return commentDao.insertComment(comment);
	}

	@Override
	public boolean deleteComment(CommentVO comment, SiteManagement user) {
		if (comment == null)
			return false;
		if (user == null)
			return false;
		// 작성자인지 확인
		CommentVO dbComment = commentDao.selectComment(comment.getCo_num());
		if (dbComment == null || dbComment.getCo_mg_num()!=(user.getSite_num()))
			return false;
		//post 테이블에서 po_co_count 수 업데이트
		commentDao.updatePostCoCountDown(dbComment);
		// 댓글 삭제
		return commentDao.deleteAjaxComment(comment.getCo_num());
	}

	@Override
	public boolean updateComment(CommentVO comment, SiteManagement user) {
		if (comment == null || !checkString(comment.getCo_content()))
			return false;
		if (user == null)
			return false;
		CommentVO dbComment = commentDao.selectComment(comment.getCo_num());
		if (dbComment == null || dbComment.getCo_mg_num()!=(user.getSite_num()))
			return false;

		return commentDao.updateComment(comment);
	}


}
