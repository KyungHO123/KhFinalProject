package kr.kh.team3.service;

import java.util.ArrayList;
import java.util.List;

import kr.kh.team3.model.vo.BookmarkVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.ReservationVO;
import kr.kh.team3.model.vo.ReviewVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface HospitalService {

	boolean signup(HospitalVO hospital, LandVO getLand);

	boolean siteSignup(SiteManagement site, LandVO getLand);

	ArrayList<HospitalSubjectVO> getHospitalSubjectList();

	HospitalVO idCheck(String ho_id);

	ArrayList<SiDoVO> getSiDoList();

	ArrayList<SiGoonGuVO> getSggList();

	ArrayList<EupMyeonDongVO> getEmdList();

	SiteManagement login(HospitalVO hospital);

	HospitalVO getHospital(SiteManagement user);

	HospitalVO getHospitalId(HospitalVO hospital);

	void setLoginFail(String ho_id);

	SiteManagement ajaxHospitalId(String site_id);

	SiteManagement ajaxHospitalEmail(String site_email);

	SiteManagement ajaxHospitalPhone(String site_phone);
	
	String ctfEmail(String email);

	//정경호 이용중인 회원만 가져오는 메서드
	ArrayList<HospitalVO> hospitalList(Criteria cri);
	//관리자 병원 관리 =========================================================
	ArrayList<HospitalVO> getWaitHospitalList(Criteria cri);
	
	ArrayList<HospitalVO> getWaitHoList();

	ArrayList<SiteManagement> getRpHoList();

	int getWHTotalCount(Criteria cri);

	int getHospitalCount(Criteria cri);

	boolean hospitalWaitOk(HospitalVO hospital);

	boolean hospitalWaitNo(HospitalVO hospital);

	ArrayList<SiteManagement> getReportHospitalList(Criteria cri);

	int getRHTotalCount(Criteria cri);

	boolean hospitalOut(HospitalVO hospital);

	boolean hospitalStop(ReportVO report);

	String hoStopCancel(HospitalVO ho);
	
	ArrayList<HospitalSubjectVO> selectSubject();

	//병원 상세 페이지==========================================
	boolean insertDetail(HospitalDetailVO detail, HospitalVO hospital);
	

	HospitalVO getHospitalInfo();

	HospitalSubjectVO getSelectedSubject(HospitalDetailVO detail, HospitalVO hospital);

	HospitalDetailVO getHoDetail(HospitalDetailVO detail, HospitalVO hospital);

	ArrayList<ReviewVO> getReviewList(Criteria cri, HospitalDetailVO detail);

	int getTotalReviewCount(Criteria cri);

	ArrayList<HospitalVO> getArrHospital(SiteManagement user);

	LandVO getLand(int emd_num);

	ArrayList<HospitalVO> getHospitalEmd(LandVO land,int hs_num, Criteria cri);

	String insertReview(ReviewVO review, MemberVO member, HospitalDetailVO ho);

	HospitalDetailVO getDetail(String ho_id);

	boolean insertLand(LandVO land);

	LandVO getLandLand(LandVO land);

	int getHospitalCountEmd(LandVO land,int hs_num, Criteria cri);

	ArrayList<HospitalVO> getBmkList(SiteManagement user, Criteria cri);

	int getBmkListCount(SiteManagement user, Criteria cri);

	ArrayList<ReviewVO> getCriReviewList(Criteria cri);

	boolean deleteReview(ReviewVO review, MemberVO member);

	boolean updateReview(ReviewVO review, MemberVO member);

	HospitalVO getHsNum(HospitalVO hospital);

	ArrayList<HsListVO> getSubjects(HospitalVO hospital);

	HospitalDetailVO getHospitalDetail(HospitalVO hospital);

	ArrayList<HospitalVO> getSubHoList(MemberVO me, LandVO land, Criteria cri);

	int getLikeSub(MemberVO me, LandVO land, Criteria cri);

	void getHospitalSubAll(int hs_num);

	ArrayList<HospitalVO> getHospitalSubAll(LandVO land, Criteria cri);

	int getHospitalSubAllCount(LandVO land, Criteria cri);

	HospitalSubjectVO getSubject(HospitalVO huser);

	LandVO getMyLand(HospitalVO huser);

	String getSdName(LandVO land);

	String getSggName(LandVO land);

	String getEmdName(LandVO land);

	HospitalVO getHo(HospitalVO hospital);

	boolean updateName(SiteManagement user, HospitalVO hospital);

	boolean updateCEO(SiteManagement user, HospitalVO hospital);

	boolean updatePhone(SiteManagement user, HospitalVO hospital);

	boolean updateEmail(SiteManagement user, HospitalVO hospital);

	boolean updateDetailAddress(SiteManagement user, HospitalVO hospital);

	HospitalVO getHoId(String ho_id);

	boolean updatePw(SiteManagement user, String ho_id, String oldPw, String newPw);

	boolean updateSubject(SiteManagement user, HospitalVO ho, int hs_num);

	LandVO getWholeLand(LandVO land);

	boolean updateAddress(SiteManagement user, HospitalVO ho, LandVO la);

	ArrayList<SiGoonGuVO> getSgg(int sd_num);

	ArrayList<EupMyeonDongVO> getEmd(int sgg_num);

	ArrayList<HospitalSubjectVO> getDetailSubject(String hd_ho_id);

	HospitalDetailVO getDetailId(int hdNum);

	LandVO getHoLand(int ho_la_num);

	SiDoVO getHdSiDoName(int la_sd_num);

	SiGoonGuVO getHdSggName(int la_sgg_num);

	EupMyeonDongVO getHdEmdName(int la_emd_num);

	HospitalVO getHospitalMypage(SiteManagement user);

	HospitalDetailVO getHospitalDetail(String po_id);

	HospitalProgramVO getHospitalProgram(int hp_num);

	boolean deleteMyInfo(HospitalVO hospital, SiteManagement user);

	boolean insertHoSub(String ho_id, int ho_hs_num);

	ArrayList<HospitalVO> getMyAreaHospitalList(int site_la_num);

	ArrayList<ReservationVO> selectAllReservationList();

	HospitalDetailVO getDetailHoId();

	HospitalDetailVO getHospitalDetail(int vw_hd_num);

	List<HospitalSubjectVO> getHoSubAutoList(String value);

	ArrayList<HospitalSubjectVO> selectSubjectAll();


}
