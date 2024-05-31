package kr.kh.team3.model.vo;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentVO {
	private int co_num;
	private String co_content;
	private Date co_date;
	private int co_report_count;
	private int co_po_num;
	private int co_mg_num;
	private String co_id;
	private SiteManagement sitemanagement;

	
	public CommentVO(int co_num) {
		this.co_num = co_num;
	}
	public String getChangeDate() {
		if (this.co_date != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			return format.format(this.co_date);
		} else {
			return "존재하지 않습니다.";
		}
	}
}
