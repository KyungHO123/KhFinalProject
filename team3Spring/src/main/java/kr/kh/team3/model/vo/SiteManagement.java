package kr.kh.team3.model.vo;

import java.util.ArrayList;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SiteManagement {
	private int site_num; //PK
	private int site_la_num; //land FK
	private String site_id;
	private String site_phone;
	private String site_email;
	private String site_authority;
	private String site_cookie; //쿠키(자동로그인)
	private Date site_cookie_limit;
	private boolean autoLogin;//자동로그인
	private MemberVO member;
	private HospitalVO hospital;
	private ArrayList<ReportVO> report;
	
}
