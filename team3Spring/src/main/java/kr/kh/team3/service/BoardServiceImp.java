package kr.kh.team3.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.dao.BoardDAO;
import kr.kh.team3.dao.HospitalDAO;
import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.FileVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import kr.kh.team3.utils.UploadFileUtils;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Component
public class BoardServiceImp implements BoardService {

	@Autowired
	private BoardDAO boardDao;
	@Autowired
	private HospitalDAO hospitalDao;
	@Autowired
	private MemberDAO memberDao;

	@Resource
	String uploadPath;

	private boolean checkString(String str) {
		return str != null && str.length() != 0;
	}

	private void deleteFile(FileVO file) {
		if (file == null) {
			return;
		}
		// 서버에서 삭제
		UploadFileUtils.delteFile(uploadPath, file.getFi_name());
		// DB에서 삭제
		boardDao.deleteFile(file.getFi_num());
	}

	private void uploadFile(int po_num, MultipartFile file) {
		if (file == null || file.getOriginalFilename().length() == 0) {
			return;
		}
		try {
			String fileOriName = file.getOriginalFilename();
			// 첨부파일 업로드 후 경로를 가져옴
			String fileName = UploadFileUtils.uploadFile(uploadPath, fileOriName, file.getBytes());
			FileVO fileVO = new FileVO(po_num, fileName, fileOriName);
			// DB에 첨부파일 정보를 추가
			boardDao.insertFile(fileVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 커뮤니티 메인에 게시판 리스트를 가져오기 위한 메서드
	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.selectBooardList();
	}

	@Override
	public ArrayList<BoardVO> getAllBoardList() {
		return boardDao.selectAllBoardList();
	}

	// 커뮤니티 메인에 게시글을 가져오기 위한 메서드
	@Override
	public ArrayList<PostVO> getAllPostList() {
		return boardDao.selectAllPostList();
	}

	// 게시판을 추가하기 위한 메서드
	@Override
	public boolean insertBoard(ArrayList<BoardVO> list, String board) {
		if (board == null) {
			return false;
		}
		for (BoardVO tmp : list) {
			if (tmp.getBo_title().equals(board)) {
				return false;
			}
		}
		return boardDao.insertBoard(board);
	}

	// 선택한 게시판이 무슨 게시판인지 확인하기 위한 메서드
	@Override
	public BoardVO getBoard(int bo_num) {
		return boardDao.selectBooard(bo_num);
	}

	@Override
	public boolean updateBoard(BoardVO boardVO, String new_BoardNames) {
		if (new_BoardNames == null) {
			return false;
		}
		ArrayList<BoardVO> boardList = boardDao.selectBooardList();
		for (BoardVO tmp : boardList) {
			if (tmp.getBo_title().equals(new_BoardNames)) {
				return false;
			}
		}
		return boardDao.updateBoard(boardVO, new_BoardNames);
	}

	@Override
	public boolean deleteBoard(int bo_num) {
		return boardDao.deleteBoard(bo_num);
	}

	@Override
	public ArrayList<BoardVO> selectBoard() {
		return boardDao.selectAllBoardList();
	}

	@Override
	public ArrayList<PostVO> getPostList(int bo_num, Criteria cri) {
		if (cri == null) {
			cri = new Criteria(1, 5);
		}
		return boardDao.selectPostList(bo_num, cri);
	}

	@Override
	public int getPostListCount(int bo_num, Criteria cri) {
		if (cri == null) {
			cri = new Criteria(1, 5);
		}
		return boardDao.selectPostListCount(bo_num, cri);
	}

	@Override
	public String getBoardName(int bo_num) {
		return boardDao.selectBoardName(bo_num);
	}

	@Override
	public boolean insertPost(SiteManagement user, PostVO post, MultipartFile[] files) {
		if (post == null || user == null) {
			return false;
		}
		if (!checkString(post.getPo_title()) || !checkString(post.getPo_content())) {
			return false;
		}
		post.setPo_mg_num(user.getSite_num());
		boolean res = boardDao.insertPost(post);
		if (!res) {
			return false;
		}
		if (files == null || files.length == 0) {
			return true;
		}
		for (MultipartFile file : files) {
			uploadFile(post.getPo_num(), file);
		}

		return true;
	}

	@Override
	public PostVO getPost(int po_num) {
		return boardDao.selectPostDetail(po_num);
	}

	@Override
	public void updateView(int po_num) {
		boardDao.updateView(po_num);
	}

	@Override
	public int recommend(RecommendVO recommend, SiteManagement user) {
		System.out.println(recommend + ", " + user);
		if (recommend == null)
			return -2;
		if (user == null)
			return -2;

		// 기존 추천 정보가 있는지 확인
		recommend.setRe_mg_num(user.getSite_num());
		RecommendVO dbRecommend = boardDao.selectRecommend(recommend);
		// 없으면 추가
		if (dbRecommend == null) {
			boardDao.insertRecommend(recommend);
		}
		// 있으면 수정
		else {
			// 취소
			if (recommend.getRe_state() == dbRecommend.getRe_state()) {
				recommend.setRe_state(0);
			}
			boardDao.updateRecommend(recommend);
		}
		return recommend.getRe_state();
	}

	@Override
	public int getUserRecommend(int num, SiteManagement user) {
		if (user == null) {
			return -2;
		}

		RecommendVO recommend = boardDao.selectRecommend(new RecommendVO(num, user.getSite_num()));
		return recommend == null ? -2 : recommend.getRe_state();
	}

	@Override
	public PostVO getPostDetail(int po_num) {
		return boardDao.selectUserPostDetail(po_num);
	}

	@Override
	public ArrayList<FileVO> getFileList(int po_num) {
		return boardDao.selectFileList(po_num);
	}

	@Override
	public ArrayList<PostVO> getUserPostList(String po_id, Criteria cri) {
		if (po_id == null || po_id.length() == 0) {
			return null;
		}
		if (cri == null) {
			cri = new Criteria(1, 5);
		}
		return boardDao.selectUserPostList(po_id, cri);
	}

	@Override
	public int getUserPostListCount(String po_id, Criteria cri) {
		if (po_id == null || po_id.length() == 0) {
			return 0;
		}
		if (cri == null) {
			cri = new Criteria(1, 5);
		}
		return boardDao.selectUserPostListCount(po_id, cri);
	}

	@Override
	public String getUserAuthority(String po_id) {
		if (po_id == null || po_id.length() == 0) {
			return null;
		}
		return boardDao.selectUserAuthority(po_id);
	}

	@Override
	public ArrayList<PostVO> getUserCmtList(String po_id, Criteria cri) {
		if (po_id == null || po_id.length() == 0) {
			return null;
		}
		if (cri == null) {
			cri = new Criteria(1, 5);
		}

		// po_id로 site_num 구하기
		SiteManagement site = boardDao.selectSiteNum(po_id);

		return boardDao.selectUserCmtList(site.getSite_num(), cri);
	}

	@Override
	public int getUserCmtListCount(String po_id, Criteria cri) {
		if (po_id == null || po_id.length() == 0) {
			return 0;
		}
		if (cri == null) {
			cri = new Criteria(1, 5);
		}

		// po_id로 site_num 구하기
		SiteManagement site = boardDao.selectSiteNum(po_id);

		return boardDao.selectUserCmtListCount(site.getSite_num(), cri);
	}
	
	@Override
	public ArrayList<PostVO> getUserRecList(int site_num, Criteria cri) {
		if (cri == null) {
			cri = new Criteria(1, 5);
		}
		return boardDao.selectUserRecList(site_num, cri);
	}

	@Override
	public int getUserRecListCount(int site_num, Criteria cri) {
		if (cri == null) {
			cri = new Criteria(1, 5);
		}
		return boardDao.selectUserRecListCount(site_num, cri);
	}
	
	

	public boolean report(ReportVO report, SiteManagement user) {
		if (report == null || user == null) {
			return false;
		}
		report.setRp_site_num(user.getSite_num());
		ReportVO dbReport = boardDao.selectReport(report);
		if (dbReport != null)
			return false;
		boardDao.insertReport(report);
		if ("member".equals(report.getRp_table())) {
			SiteManagement member = memberDao.selectReportMemberTarget(report.getRp_target());
			if (member.getSite_authority().equals("USER")) {
				memberDao.updateMemberRpCount(member.getSite_id());
			} else if (member.getSite_authority().equals("MANAGER")) {
				hospitalDao.updateHospitalRpCount(member.getSite_id());
			}
			return true;
		} else if (report.getRp_table().equals("post")) {
			PostVO post = boardDao.selectPostTartget(report.getRp_target());
			boardDao.updatePostRpCount(post.getPo_num());
		} else if (report.getRp_table().equals("comment")) {
			CommentVO comment = boardDao.selectCommentTartget(report.getRp_target());
			boardDao.updateCommentRpCount(comment.getCo_num());
		}
		return true;
	}

	@Override
	public int getRpTarget(String rp_target_id) {
		return memberDao.selectTarget(rp_target_id);
	}

	@Override
	public boolean deletePost(int po_num, SiteManagement user) {
		if (user == null) {
			return false;
		}
		// 게시글 번호에 맞는 게시글을 가져옴
		PostVO post = boardDao.selectPosta(po_num);
		// 게시글이 없거나 작성자가 아니면 false를 리턴
		if (post == null || post.getPo_mg_num() != user.getSite_num()) {
			return false;
		}
		// 맞으면 삭제 후 결과를 리턴
		// 서버의 첨부파일 삭제 및 DB에서 제거
		// 게시글 번호에 맞는 첨부파일 리스트를 가져옴
		ArrayList<FileVO> fileList = boardDao.selectFileList(po_num);
		// 첨부파일 리스트가 있으면 반복문으로 첨부파일을 삭제
		if (fileList != null) {
			for (FileVO file : fileList) {
				deleteFile(file);
			}
		}
		// 게시글 삭제
		return boardDao.deletePost(po_num);
	}

	@Override
	public boolean updateMyPost(PostVO post, SiteManagement user, MultipartFile[] file, int[] delNums) {
		if (post == null || !checkString(post.getPo_title()) || !checkString(post.getPo_content())) {
			return false;
		}
		if (user == null) {
			return false;
		}
		ArrayList<PostVO> dbPost = boardDao.selectMyPostEq(user.getSite_num());
		if (dbPost == null || dbPost.isEmpty()) {
			return false;
		}
		boolean res = boardDao.updateMyPost(post);
		if (!res) {
			return false;
		}
		if (file != null) {
			for (MultipartFile tmp : file) {
				uploadFile(post.getPo_num(), tmp);
			}
		}
		if (delNums == null ||file==null) {
			return true;
		}
		for (int tmp : delNums) {
			FileVO fileVo = boardDao.selectFile(tmp);
			deleteFile(fileVo);
		}
		return true;
	}

	@Override
	public ArrayList<PostVO> selectHotPostList() {
		return boardDao.selectHotPostList();
	}

	@Override
	public ArrayList<PostVO> selectNoticeList() {
		return boardDao.selectNoticeList();
	}

}
