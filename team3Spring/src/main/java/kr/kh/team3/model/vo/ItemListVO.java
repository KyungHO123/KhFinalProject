package kr.kh.team3.model.vo;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ItemListVO {
	private int il_num;
	private int il_hp_num; 
	private int il_it_num;
	private HospitalProgramVO hospital_program;
	private ItemVO item;

}
