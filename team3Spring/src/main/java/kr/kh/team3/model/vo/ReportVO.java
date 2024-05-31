package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
	private int rp_num;
	private int rp_target; //신고 대상(신고 당하는 사람)
	private String rp_name; //신고 사유명
	private String rp_table;
	private String rp_rs_name; //신고 상태명?
	private int rp_site_num; //사이트 회원관리번호
	private MemberVO member;
	private HospitalVO hospital;
	private SiteManagement siteManagement;
	public void getRp_site_num(int site_num) {
		rp_site_num = site_num;
	}
	public ReportVO(int rp_target, String rp_name, String rp_table) {
		this.rp_target = rp_target;
		this.rp_name = rp_name;
		this.rp_table = rp_table;
	}
	
}
