package kr.kh.team3.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	
	private String me_id;
	private int me_hs_num; //병원 과목 번호
	private String me_ms_state; //회원 상태명
	private int me_bmk_num; //북마크 번호
	private int me_la_num; //주소 번호
	private String me_pw;
	private String me_name;
	private String me_gender;
	private String me_phone;
	private String me_email;
	private String me_address;
	private String me_authority;
	private int me_fail; //로그인 실패 횟수
	private Date me_stop; //정지 기간
	private int me_report_count; //신고 누적 횟수
	private int me_stop_count; //정지 누적 횟수
	private boolean autoLogin;//자동로그인
	private HospitalSubjectVO hospitalSubject;
	private ReportVO report;
	private SiteManagement siteManagement;
	private LandVO land;

	public String getChangeDate() {
		if (this.me_stop != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			return format.format(this.me_stop);
		} else {
			return "존재하지 않습니다.";
		}
	}
}
