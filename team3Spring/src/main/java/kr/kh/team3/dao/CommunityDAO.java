package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.pagination.Criteria;

public interface CommunityDAO {

	ArrayList<PostVO> selectPostList(@Param("site_num") int site_num);

	ArrayList<CommentVO> selectCommentList(@Param("site_num") int site_num);

	ArrayList<RecommendVO> selectRecommendList(@Param("site_num") int site_num);

	ArrayList<PostVO> selectCriPostList(@Param("cri") Criteria cri, @Param("po_id") String site_id);

	int selectPostTotalCount(@Param("po_id") String site_id);

	ArrayList<CommentVO> selectCriCommentList(@Param("cri") Criteria cri, @Param("co_id") String site_id);

	int selectCommentTotalCount(@Param("co_id") String site_id);

	ArrayList<RecommendVO> selectCriRecommendList
	(@Param("cri") Criteria cri, @Param("re_id") String site_id);

	int selectRecommendTotalCount(@Param("re_id") String site_id);

	ArrayList<RecommendVO> selectAllRecommendList(@Param("site_num") int site_num);

	boolean deleteReportPostDelete(@Param("po_num")int po_num);

	boolean deleteReportCommentDelete(@Param("co_num")int co_num);

	ArrayList<RecommendVO> selectDBState(@Param("site_num") int site_num);

	void deleteDBState(@Param("site_num") int site_num);
}
