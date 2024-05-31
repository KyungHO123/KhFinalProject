package kr.kh.team3.model.vo;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostVO {
	private int po_num;
	private String po_title;
	private String po_content;
	private int po_report_count;
	private Date po_date;
	private int po_bo_num; 
	private int po_mg_num;
	private int po_view;
	private int po_up;
	private int po_down;
	private int po_co_count;
	private String po_bo_title;
	private String po_id;
	private SiteManagement sitemanagement;
	private BoardVO board;
	private RecommendVO recommend;
	
	
	public PostVO(int po_num, int po_bo_num) {
		super();
		this.po_num = po_num;
		this.po_bo_num = po_bo_num;
	}
	
	public String getChangeDate() {
		if (this.po_date != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			return format.format(this.po_date);
		} else {
			return "존재하지 않습니다.";
		}
	}
	public String getChangeDate1() {
		if (this.po_date != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			return format.format(this.po_date);
		} else {
			return "존재하지 않습니다.";
		}
	}
	
}
