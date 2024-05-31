package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.PostDAO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.pagination.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Component
public class PostServiceImp implements PostService{
	
	@Autowired
	PostDAO postDao;

	@Override
	public ArrayList<PostVO> getPostList(Criteria cri, int bo_num) {
		return postDao.selectPostList(cri, bo_num);
	}

	@Override
	public int getPostCount(Criteria cri, int bo_num) {
		// TODO Auto-generated method stub
		return postDao.selectPostTotalCount(cri, bo_num);
	}

	@Override
	public boolean deletePost(PostVO post) {
		if(post.getPo_num() == 0) {
				return false;
			}
			
		return postDao.deletePost(post);
	}


	@Override
	public ArrayList<PostVO> getPostNoList(Criteria cri, int bo_num) {
		// TODO Auto-generated method stub
		return postDao.selectPostNoList(cri, bo_num);
	}

	@Override
	public int getPostNoCount(Criteria cri, int bo_num) {
		// TODO Auto-generated method stub
		return postDao.selectPostNoTotalCount(cri, bo_num);
	}

}
