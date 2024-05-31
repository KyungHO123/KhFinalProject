package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BookmarkVO {
	private int bmk_num;
	private String bmk_ho_id;
	private String bmk_me_id;
	HospitalVO hospital;
	private MemberVO member;
}
