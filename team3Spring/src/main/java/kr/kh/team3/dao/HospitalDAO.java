package kr.kh.team3.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.BookmarkVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReservationVO;
import kr.kh.team3.model.vo.ReviewVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface HospitalDAO {

	HospitalVO selectHospitalId(@Param("ho_id") String ho_id);
	
	LandVO selectLand(@Param("la") LandVO land);

	boolean insertHospital(@Param("ho") HospitalVO hospital, @Param("la") LandVO land);

	boolean insertSiteHospital(@Param("si") SiteManagement site,@Param("la") LandVO getLand);

	ArrayList<HospitalSubjectVO> selectHospitalSubjectList();

	ArrayList<SiDoVO> selectSiDoList();

	ArrayList<SiGoonGuVO> selectSggList();

	ArrayList<EupMyeonDongVO> selectEmdList();

	HospitalVO selectHospital(@Param("ho_id")String ho_id);

	SiteManagement selectSite(@Param("ho_id")String ho_id);

	void updateLoginFail(@Param("ho_id")String ho_id);

	void updateLoginFailZero(@Param("ho_id")String ho_id);
	
	//회원가입 아이디, 이메일, 폰 사이트 매니지먼트 중복 체크
	SiteManagement selectSiteId(@Param("site_id") String site_id);
	
	SiteManagement selectHospitalEmail(@Param("site_email") String st_email);

	SiteManagement selectHospitalPhone(@Param("site_phone") String site_phone);

	// ======================== 병원 관리 ==========================
	//이용중인 병원만 호출
	ArrayList<HospitalVO> hospitalList(@Param("cri")Criteria cri);
	//정경호 
	int selectHospitalCount(@Param("cri")Criteria cri);
	
	ArrayList<HospitalVO> selectWaitHospitalList(@Param("cri")Criteria cri);

	int selectWHTotalCount(@Param("cri")Criteria cri);

	boolean updateWaitOk(@Param("ho_id")String ho_id);

	boolean updateWaitNo(@Param("ho_id")String ho_id);

	ArrayList<SiteManagement> selectReportHospitalList(@Param("cri")Criteria cri);

	int selectRHTotalCount(@Param("cri")Criteria cri);

	boolean deleteHospital(@Param("ho_id")String ho_id);

	boolean deleteSite(@Param("ho_id")String ho_id);
	
	boolean updateHospitalStop(@Param("ho_id")String ho_id, @Param("rp_rs_name")String rp_rs_name);

	void updateHoStopCancel(@Param("ho_id")String ho_id);

	boolean updateHospitalStopPlus(@Param("ho_id")String ho_id, @Param("rp_rs_name")String rp_rs_name);

	//============================= 병원 페이지 ===============================
	HospitalVO selectHospitalInfo();

	HospitalSubjectVO selectSelectedSubject(@Param("detail") HospitalDetailVO detail);

	HospitalDetailVO selectHoDetail(@Param("hospital") HospitalVO hospital);

	boolean deleteHospitalDetail(@Param("hd_ho_id") String hd_ho_id);

	ArrayList<ReviewVO> selectReviewList(@Param("cri") Criteria cri, @Param("detail") HospitalDetailVO detail);

	int selectTotalReviewCount(@Param("cri") Criteria cri);
	
	ArrayList<HospitalVO> getArrHospital(@Param("us")SiteManagement user);

	LandVO getLand(@Param("num")int emd_num);

	HospitalVO getHospital(@Param("ho_id")String hd_ho_id, @Param("la_num")int me_la_num);
  
//	HospitalDetailVO selectDetail(@Param("hd_num") int hdNum);

	boolean insertReview(@Param("vw") ReviewVO review);

	boolean insertLand(@Param("la") LandVO land);
	
	ArrayList<HospitalVO> getHospitalList(@Param("la")LandVO land,@Param("cri") Criteria cri,@Param("hs_num") int hs_num);

	int getHospitalListCount(@Param("la")LandVO land,@Param("cri") Criteria cri,@Param("hs_num") int hs_num);

	ArrayList<HospitalVO> selectBmkList(@Param("user")SiteManagement user, @Param("cri")Criteria cri);

	int selectBmkListCount(@Param("user")SiteManagement user, @Param("cri")Criteria cri);

	ArrayList<ReviewVO> selectCriReviewList(@Param("cri") Criteria cri);

	ReviewVO selectReview(@Param("vw_num") int vw_num);

	boolean deleteReview(@Param("vw_num") int vw_num);

	boolean updateReview(@Param("vw") ReviewVO review);

	HospitalVO selectHsNum(@Param("hospital") HospitalVO hospital);

	ArrayList<HsListVO> selectSubjects(@Param("ho") HospitalVO hospital);

	boolean insertHoDetail(@Param("ho") HospitalVO hospital, @Param("hd") HospitalDetailVO detail);

	boolean updateHoDetail(@Param("ho_id") String ho_id, @Param("hd") HospitalDetailVO detail);
	
	boolean insertSubjects(@Param("ho") HospitalVO hospital, @Param("hsl_hs_num") Integer tmp);

	boolean updateSubjects(@Param("ho") HospitalVO hospital, @Param("hsl_hs_num") Integer tmp);

	ArrayList<HospitalVO> getSubHoList(@Param("me")MemberVO me,@Param("la") LandVO land,@Param("cri") Criteria cri);

	int getTotalSubHoList(@Param("me")MemberVO me, @Param("la")LandVO land,@Param("cri") Criteria cri);

	ArrayList<HospitalVO> selectHospitalAll(@Param("la")LandVO land,@Param("cri") Criteria cri);

	int selectHospitalAllCount(@Param("la")LandVO land,@Param("cri") Criteria cri);

	boolean deleteSubjects(@Param("ho") HospitalVO hospital, @Param("hsl_hs_num") int i);

	HospitalSubjectVO selectSubject(@Param("ho") HospitalVO huser);

	LandVO selectMyLand(@Param("ho") HospitalVO huser);

	String selectSdName(@Param("la") LandVO land);

	String selectSggName(@Param("la") LandVO land);

	String selectEmdName(@Param("la") LandVO land);

	boolean updateName(@Param("ho") HospitalVO hospital);

	boolean updateCEO(@Param("ho") HospitalVO hospital);

	boolean updatePhone(@Param("ho") HospitalVO hospital);

	boolean updateEmail(@Param("ho") HospitalVO hospital);

	boolean updateDetailAddress(@Param("ho") HospitalVO hospital);

	boolean updatePw(@Param("pw") String encPw, @Param("ho_id") String ho_id);

	boolean updateSubject(@Param("ho_id") String ho_id, @Param("hs_num") int hs_num);

	boolean updateHospitalLand(@Param("ho") HospitalVO ho, @Param("la") LandVO la);

	boolean updateSiteLand(@Param("site") SiteManagement user, @Param("la") LandVO la);

	ArrayList<SiGoonGuVO> selectSgg(@Param("sd_num") int sd_num);

	ArrayList<EupMyeonDongVO> selectEmd(@Param("sgg_num") int sgg_num);

	ArrayList<HospitalSubjectVO> selectDetailSubject(@Param("hd_ho_id") String hd_ho_id);

	HospitalDetailVO selectDetailId(@Param("hd_num") int hd_num);

	LandVO selectHoLand(@Param("ho_la_num") int ho_la_num);

	SiDoVO selectHdSiDoName(@Param("la_sd_num") int la_sd_num);

	SiGoonGuVO selectHdSggName(@Param("la_sgg_num") int la_sgg_num);

	EupMyeonDongVO selectHdEmdName(@Param("la_emd_num") int la_emd_num);

	HospitalDetailVO selectDetail(@Param("ho_id")String ho_id);

	HospitalVO selectHospitalPage(@Param("id")String site_id);

	ArrayList<HospitalVO> selectHospitalArrList();
  
	SiteManagement selectHospitalReportTarget(@Param("num")int rp_target);

	int selectHdNum(@Param("id")String po_id);

	void updateHospitalRpCount(@Param("id")String site_id);

	HospitalDetailVO selectHospitalDetail(@Param("ho_id")String po_id);

	HospitalProgramVO selectHospitalProgram(@Param("hp_num")int hp_num);

	ArrayList<HospitalVO> selectWaitHoList();

	ArrayList<SiteManagement> selectRpHoList();

	ArrayList<HospitalSubjectVO> selectHospitalSubjectListHome();
	
	ArrayList<HospitalSubjectVO> selectHoSubListAll();

	boolean deleteSiteHospital(@Param("site_id") String site_id);

	boolean insertHoSub(@Param("ho_id") String ho_id, @Param("ho_hs_num") int ho_hs_num);

	ArrayList<HospitalVO> selectMyAreaHospitalList(@Param("n")int site_la_num);

	ArrayList<ReservationVO> selectAllReservationList();

	HospitalDetailVO selectDetailHoId();

	HospitalDetailVO selectHospitalDet(@Param("hd_num")int vw_hd_num);

	List<HospitalSubjectVO> selectHoSubAutoList(@Param("value")String value);

	void updatePassword(@Param("id") String id, @Param("pw") String encPw);

}
