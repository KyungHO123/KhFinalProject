package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.pagination.Criteria;

public interface CommentDAO {

	ArrayList<CommentVO> selectCommentList(@Param("cri")Criteria cri, @Param("po_num")int po_num);

	int selectCommentTotalCount(@Param("cri")Criteria cri, @Param("po_num")int po_num);

	boolean deleteComment(@Param("comment")CommentVO comment);

	int selectCommentNoTotalCount(@Param("cri")Criteria cri, @Param("po_num")int po_num);

	ArrayList<CommentVO> selectCommentNoList(@Param("cri")Criteria cri, @Param("po_num")int po_num);

	ArrayList<CommentVO> selectAjaxCommentList(@Param("cri")Criteria cri);

	int selectTotalCount(@Param("cri")Criteria cri);

	boolean insertComment(@Param("co")CommentVO comment);

	CommentVO selectComment(@Param("co")int co_num);

	boolean deleteAjaxComment(@Param("co")int co_num);

	boolean updateComment(@Param("co")CommentVO comment);

	void updatePostCoCountUp(@Param("co")CommentVO comment);

	void updatePostCoCountDown(@Param("co")CommentVO comment);

}
