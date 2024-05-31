package kr.kh.team3.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationScheduleVO {
	private int rs_num;
	private int rs_hp_num; 
	private Date rs_date;
	private Date rs_time;
	private int rs_max_person;
	private HospitalProgramVO program;
	
	public String getRsDate() {
	    if (this.rs_date != null) {
	        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
	        return format.format(this.rs_date);
	    } else {
	        return "존재하지 않습니다.";
	    }
	}
	
	public String getRsTime() {
	    if (this.rs_time != null) {
	        SimpleDateFormat format = new SimpleDateFormat("HH시 mm분");
	        return format.format(this.rs_time);
	    } else {
	        return "존재하지 않습니다.";
	    }
	}
	
	public String getRsDate2() {
	    if (this.rs_date != null) {
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        return format.format(this.rs_date);
	    } else {
	        return "존재하지 않습니다.";
	    }
	}
	
}
