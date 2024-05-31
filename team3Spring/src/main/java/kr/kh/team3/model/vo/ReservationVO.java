package kr.kh.team3.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationVO {
	
	private int rv_num;
	private String rv_rvs_name;
	private int rv_rs_num;
	private String rv_me_id;
	private Date rv_date;

	private ReservationScheduleVO ReservationScheduleVO;
	private HospitalProgramVO hospitalProgram;
	private HospitalVO hospital;
	private ReservationScheduleVO schedule;

	private MemberVO MemberVO;
	
	public ReservationVO(String rv_rvs_name, int rv_rs_num, String rv_me_id) {
		this.rv_rvs_name = rv_rvs_name;
		this.rv_rs_num = rv_rs_num;
		this.rv_me_id = rv_me_id;
	}
	
	public String getChangeDate() {
		if (this.rv_date != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			return format.format(this.rv_date);
		} else {
			return "존재하지 않습니다.";
		}
	}

	public String getMaskedId() {
	    if (this.rv_me_id != null && this.rv_me_id.length() >= 4) {
	        String maskedId = this.rv_me_id.substring(0, 4); // 첫 번째부터 네 번째 문자까지 유지
	        maskedId += "*".repeat(this.rv_me_id.length() - 4); // 나머지 문자를 '*'로 대체
	        return maskedId;
	    } else {
	        return "존재하지 않습니다.";
	    }
	}
}
