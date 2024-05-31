package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface CommunityService {

	ArrayList<PostVO> getPostList(SiteManagement user);

	ArrayList<CommentVO> getCommentList(SiteManagement user);

	ArrayList<RecommendVO> getRecommendList(SiteManagement user);

	ArrayList<PostVO> getCriPostList(Criteria cri, String site_id);

	int getPostTotalCount(Criteria cri, String site_id);

	ArrayList<CommentVO> getCriCommentList(Criteria cri, String site_id);

	int getCommentTotalCount(Criteria cri, String site_id);

	ArrayList<RecommendVO> getCriRecommendList(Criteria cri, String site_id, SiteManagement user);

	int getRecommendTotalCount(Criteria cri, String site_id);

	ArrayList<RecommendVO> getAllRecommendList(Criteria cri, SiteManagement user);

	boolean reportPostDelete(int po_num);

	boolean reportCommentDelete(int co_num);

}
