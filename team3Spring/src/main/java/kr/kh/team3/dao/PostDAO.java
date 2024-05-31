package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.pagination.Criteria;

public interface PostDAO {

	ArrayList<PostVO> selectPostList(@Param("cri") Criteria cri, @Param("bo_num")int bo_num);

	int selectPostTotalCount(@Param("cri")Criteria cri, @Param("bo_num")int bo_num);

	boolean deletePost(@Param("post")PostVO post);

	ArrayList<PostVO> selectPostNoList(@Param("cri") Criteria cri, @Param("bo_num")int bo_num);

	int selectPostNoTotalCount(@Param("cri")Criteria cri, @Param("bo_num")int bo_num);


}
