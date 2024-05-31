package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.FileVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface BoardService {

	//커뮤니티 메인에 게시판 리스트를 가져오기 위한 메서드
	ArrayList<BoardVO> getBoardList();
	
	//게시판을 추가하기 위한 메서드
	boolean insertBoard(ArrayList<BoardVO> list, String board);

	//선택한 게시판이 무슨 게시판인지 확인하기 위한 메서드
	BoardVO getBoard(int bo_num);

	boolean updateBoard(BoardVO boardVO, String new_BoardName);

	boolean deleteBoard(int bo_num);

	ArrayList<BoardVO> selectBoard();

	ArrayList<PostVO> getPostList(int bo_num, Criteria cri);
  
  int getPostListCount(int bo_num, Criteria cri);

	ArrayList<PostVO> getAllPostList();

	ArrayList<BoardVO> getAllBoardList();

	String getBoardName(int bo_num);

	boolean insertPost(SiteManagement user, PostVO post, MultipartFile[] files);

	PostVO getPost(int po_num);

	void updateView(int po_num);

	int recommend(RecommendVO recommend, SiteManagement user);

	int getUserRecommend(int num, SiteManagement user);

	PostVO getPostDetail(int po_num);
  
	ArrayList<FileVO> getFileList(int po_num);

	ArrayList<PostVO> getUserPostList(String po_id, Criteria cri);

	String getUserAuthority(String po_id);

	int getUserPostListCount(String po_id, Criteria cri);

	boolean report(ReportVO report, SiteManagement user);

	int getRpTarget(String rp_target_id);
	ArrayList<PostVO> getUserCmtList(String po_id, Criteria cri);

	int getUserCmtListCount(String po_id, Criteria cri);

	boolean deletePost(int po_num, SiteManagement user);

	boolean updateMyPost(PostVO post, SiteManagement user, MultipartFile[] file, int[] delNums);

	ArrayList<PostVO> selectHotPostList();

	ArrayList<PostVO> selectNoticeList();

	ArrayList<PostVO> getUserRecList(int site_num, Criteria cri);

	int getUserRecListCount(int site_num, Criteria cri);



	
}
