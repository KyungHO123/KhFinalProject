package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PaymentVO {
	private String pm_num;
	private String pm_type;
	private String pm_ps_name;
	private int pm_price;
	private int pm_rv_num;
	private String pm_ho_id;
	HospitalVO hospital;
	ReservationVO reservation;
	
	public PaymentVO(String pm_num, String pm_type, String pm_ps_name, int pm_price, int pm_rv_num, String pm_ho_id) {
		this.pm_num = pm_num;
		this.pm_type = pm_type;
		this.pm_ps_name = pm_ps_name;
		this.pm_price = pm_price;
		this.pm_rv_num = pm_rv_num;
		this.pm_ho_id = pm_ho_id;
	}
	
	
}
