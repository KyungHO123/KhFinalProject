package kr.kh.team3.model.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int bo_num;
	private String bo_title;
	private ArrayList<PostVO> post;
}
