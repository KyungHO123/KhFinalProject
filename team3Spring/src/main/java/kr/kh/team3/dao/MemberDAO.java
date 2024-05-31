package kr.kh.team3.dao;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.BookmarkVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.ReservationVO;
import kr.kh.team3.model.vo.ReviewVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface MemberDAO {


	boolean insertMember(@Param("me")MemberVO member, @Param("la")LandVO getLand);

	boolean insertSiteMember(@Param("si")SiteManagement site, @Param("la")LandVO getLand);
	//ajax로도 사용함
	MemberVO selectMember(@Param("me_id")String me_id);

	ArrayList<SiDoVO> selectSiDo();

	ArrayList<SiGoonGuVO> selectSgg(@Param("sd_num") int sd_num);

	ArrayList<EupMyeonDongVO> selectEmd(@Param("sgg_num")int sggNum);
	
	SiteManagement selectSite(@Param("me_id")String me_id);

	void updateLoginFail(@Param("me_id")String me_id);

	void updateLoginFailZero(@Param("me_id")String me_id);
	//ajax용 이메일
	SiteManagement selectMemberEmail(@Param("email")String site_email);
	//ajax용 폰번호 
	SiteManagement selectMemberPhone(@Param("phone")String site_phone);
	
	//관리자 - 회원 관리
	ArrayList<MemberVO> selectMemberList(@Param("cri") Criteria cri);

	int selectMemberTotalCount(@Param("cri") Criteria cri);

	MemberVO selectMemberSiteId(@Param("me_id")String me_id);

	ArrayList<SiteManagement> selectReportMemberList(@Param("cri") Criteria cri);

	int selectReportMemberTotalCount(@Param("cri") Criteria cri);

	boolean updateStopMember(@Param("me_id") String me_id, @Param("rp_rs_name") String rp_rs_name);

	boolean deleteMember(@Param("me_id") String me_id);
	
	SiteManagement selectSiteMemberId(@Param("site_id") String site_id);

	boolean deleteSiteManagement(@Param("site_id") String site_id);

	boolean updatePlusStopMember(@Param("me_id") String me_id, @Param("rp_rs_name") String rp_rs_name);

	MemberVO getMemberInfo(@Param("id") String site_id);


	boolean updateName(@Param("me")MemberVO member);

	boolean updatePhone(@Param("me")MemberVO member);

	boolean updateEmail(@Param("me")MemberVO member);

	boolean updateJob(@Param("me")MemberVO member);

	boolean updatePw(@Param("pw")String newPw,@Param("id") String me_id);

	MemberVO getMemberPw(@Param("pw")String me_pw);

	MemberVO getMemberById(@Param("me_id") String me_id);

	boolean insertLand(@Param("la")LandVO land);

	LandVO selectLand(@Param("la")LandVO land);

	LandVO getMyLand(@Param("me")MemberVO muser);

	String selectSdName(@Param("la")LandVO land);

	String selectSggName(@Param("la")LandVO land);

	String selectEmdName(@Param("la")LandVO land);

	boolean updateMemberLand(@Param("me")MemberVO me,@Param("la") LandVO la);

	boolean updateSiteLand(@Param("site")SiteManagement user,@Param("la") LandVO la);

	boolean updateSubject(@Param("id")String me_id,@Param("num") int hs_num);

	HospitalSubjectVO selectSubject(@Param("me")MemberVO muser);

	LandVO selectMyLand(@Param("num")int site_la_num);

	ArrayList<HospitalDetailVO> getMySubject();

	//병원 상세 페이지 북마크 : 양선진
	BookmarkVO selectBookmark(@Param("me_id") String me_id, @Param("hd_ho_id") String hd_ho_id);

	boolean deleteBookmark(@Param("bmk_ho_id") String bmk_ho_id, @Param("bmk_me_id") String bmk_me_id);

	boolean insertBookmark(@Param("me") MemberVO member, @Param("hd_ho_id") String hd_ho_id);

	BookmarkVO selectDetailBookmark(@Param("me_id") String me_id, @Param("hd_ho_id") String hd_ho_id);

	ArrayList<SiteManagement> selectMemberArrList();

	void updateRpCount(@Param("me_id")String me_id);

	ArrayList<MemberVO> selectUserArrList();

	void updateMemberRpCount(@Param("id")String id);

	SiteManagement selectReportMemberTarget(@Param("reUser")int reUser);

	int selectTarget(@Param("id")String rp_target_id);

	SiteManagement selectSiteMember(@Param("rp_target") int rp_target);

	boolean deleteMyInfo(@Param("id")String site_id);

	ArrayList<ReportVO> selectMeRpList();

	ArrayList<MemberVO> selectMemberLand();

	int selectReservationId(@Param("ho_id") String ho_id, @Param("me_id") String me_id);

	int getMemberReservation(@Param("me_id") String me_id, @Param("ho")HospitalDetailVO ho);

	int selectReviews(@Param("id")String me_id, @Param("ho")HospitalDetailVO ho);

	SiteManagement selectMyIddd(@Param("id")String me_id);

	void updateMemberCookie(@Param("user")SiteManagement user);

	SiteManagement selectMemberByCookie(@Param("session_Id")String sessionId);

	SiteManagement selectUser(@Param("id") String id);

	void updatePassword(@Param("id") String id, @Param("pw") String encPw);

	SiteManagement selectUserFindId(@Param("email") String email, @Param("phone") String phone);

	SiteManagement selectSiteUser(@Param("email") String email);

}