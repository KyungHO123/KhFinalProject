package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.pagination.Criteria;

public interface PostService {

	ArrayList<PostVO> getPostList(Criteria cri, int bo_num);

	int getPostCount(Criteria cri, int bo_num);

	boolean deletePost(PostVO post);

	ArrayList<PostVO> getPostNoList(Criteria cri, int bo_num);

	int getPostNoCount(Criteria cri, int bo_num);

}
