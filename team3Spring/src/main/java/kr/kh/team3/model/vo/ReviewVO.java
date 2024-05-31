package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReviewVO {
	
	private int vw_num;
	private int vw_hd_num; //병원 상세 페이지 번호
	private String vw_me_id;
	private String vw_content;
	
}
