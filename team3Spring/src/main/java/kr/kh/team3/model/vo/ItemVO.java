package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ItemVO {
	private int it_num;
	private String it_name;
	private String it_explanation;
	private int it_hsl_num;
}
