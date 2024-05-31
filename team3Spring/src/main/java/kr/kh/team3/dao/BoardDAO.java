package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.FileVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.pagination.Criteria;

public interface BoardDAO {

	ArrayList<BoardVO> selectBooardList();

	boolean insertBoard(@Param("board")String board);

	BoardVO selectBooard(@Param("bo_num")int bo_num);

	boolean updateBoard(@Param("board")BoardVO boardVO, @Param("name")String new_BoardNames);

	boolean deleteBoard(@Param("bo_num")int bo_num);

	ArrayList<PostVO> selectPostList(@Param("bo_num")int bo_num, @Param("cri")Criteria cri);

	int selectPostListCount(@Param("bo_num")int bo_num, @Param("cri")Criteria cri);
	
	ArrayList<PostVO> selectAllPostList();

	ArrayList<BoardVO> selectAllBoardList();

	String selectBoardName(@Param("num")int bo_num);

	void insertFile(@Param("file")FileVO fileVO);

	boolean insertPost(@Param("post")PostVO post);

	PostVO selectPostDetail(@Param("num")int po_num);

	void updateView(@Param("num")int po_num);

	RecommendVO selectRecommend(@Param("re")RecommendVO recommend);

	void insertRecommend(@Param("re")RecommendVO recommend);

	void updateRecommend(@Param("re")RecommendVO recommend);

	PostVO selectUserPostDetail(@Param("num")int po_num);

	ArrayList<FileVO> selectFileList(@Param("re")int po_num);

	ArrayList<PostVO> selectUserPostList(@Param("po_id")String po_id, @Param("cri")Criteria cri);
	
	int selectUserPostListCount(@Param("po_id")String po_id, @Param("cri")Criteria cri);

	String selectUserAuthority(@Param("po_id")String po_id);

	SiteManagement selectSiteNum(@Param("po_id")String po_id);
	
	ArrayList<PostVO> selectUserCmtList(@Param("site_num")int site_num, @Param("cri")Criteria cri);

	int selectUserCmtListCount(@Param("site_num")int site_num, @Param("cri")Criteria cri);
	
	ArrayList<PostVO> selectUserRecList(@Param("site_num")int site_num, @Param("cri")Criteria cri);

	int selectUserRecListCount(@Param("site_num")int site_num, @Param("cri")Criteria cri);

    ReportVO selectReport(@Param("rp")ReportVO report);

	void insertReport(@Param("rp")ReportVO report);

	void updateReport(@Param("rp")ReportVO report);

	PostVO selectPostTartget(@Param("rp")int rp_target);

	void updatePostRpCount(@Param("rp")int po_num);

	CommentVO selectCommentTartget(@Param("rp")int rp_target);

	void updateCommentRpCount(@Param("rp")int co_num);

	PostVO selectPosta(@Param("rp")int po_num);

	void deleteFile(@Param("rp")int fi_num);

	boolean deletePost(@Param("rp")int po_num);

	int selectboardNumber();

	boolean updateMyPost(@Param("po")PostVO post);

	FileVO selectFile(@Param("fi")int tmp);

	ArrayList<PostVO> selectMyPostEq(@Param("po")int po_num);

	ArrayList<PostVO> selectHotPostList();

	ArrayList<PostVO> selectNoticeList();

}
