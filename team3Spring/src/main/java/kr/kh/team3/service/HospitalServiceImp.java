package kr.kh.team3.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.HospitalDAO;
import kr.kh.team3.dao.MemberDAO;
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
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Component
public class HospitalServiceImp implements HospitalService {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	MemberDAO memberDao;

	@Autowired
	private HospitalDAO hospitalDao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 랜덤 문자열
	private String randomString(int size) {
		String strs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String newCertification = "";
		int min = 0, max = strs.length() - 1;
		while (newCertification.length() < size) {
			int r = (int) (Math.random() * (max - min + 1) + min);
			newCertification += strs.charAt(r);
		}
		return newCertification;
	}

	private boolean checkStr(String str) {
		return str != null && str.length() != 0;
	}

	// 회원가입
	public boolean signup(HospitalVO hospital, LandVO land) {
		if (hospital == null || hospital.getHo_id().length() == 0 || !checkStr(hospital.getHo_id())
				|| !checkStr(hospital.getHo_pw())) {
			return false;
		}

		// 비번 암호화
		String endPw = passwordEncoder.encode(hospital.getHo_pw());
		hospital.setHo_pw(endPw);

		return hospitalDao.insertHospital(hospital, land);
	}

	// 사이트 회원관리 아이디
	public boolean siteSignup(SiteManagement site, LandVO getLand) {
		if (site == null || site.getSite_id().length() == 0) {
			return false;
		}

		return hospitalDao.insertSiteHospital(site, getLand);
	}

	public ArrayList<HospitalSubjectVO> getHospitalSubjectList() {
		return hospitalDao.selectHospitalSubjectList();
	}

	// 아이디 중복 체크
	public HospitalVO idCheck(String ho_id) {
		return hospitalDao.selectHospitalId(ho_id);
	}

	@Override
	public ArrayList<SiDoVO> getSiDoList() {
		return hospitalDao.selectSiDoList();
	}

	@Override
	public ArrayList<SiGoonGuVO> getSggList() {
		return hospitalDao.selectSggList();
	}

	@Override
	public ArrayList<EupMyeonDongVO> getEmdList() {
		return hospitalDao.selectEmdList();
	}

	@Override
	public SiteManagement login(HospitalVO hospital) {
		// 매개변수 null 처리
		if (hospital == null || hospital.getHo_id() == null || hospital.getHo_pw() == null)
			return null;
		// 아이디 확인
		HospitalVO user = hospitalDao.selectHospital(hospital.getHo_id());
		if (user == null) {
			return null;
		}
		// 사업자번호 확인
		if (!hospital.getHo_num().equals(user.getHo_num())) {
			return null;
		}

		// 비번 확인
		// 맞으면 site 정보 return
		if (passwordEncoder.matches(hospital.getHo_pw(), user.getHo_pw())) {
			hospitalDao.updateLoginFailZero(user.getHo_id());

			return hospitalDao.selectSite(user.getHo_id());
		}
		return null;
	}

	@Override
	public HospitalVO getHospital(SiteManagement user) {
		if (user == null || user.getSite_id() == null) {
			return null;
		}
		return hospitalDao.selectHospital(user.getSite_id());
	}

	@Override
	public void setLoginFail(String ho_id) {
		hospitalDao.updateLoginFail(ho_id);
	}

	@Override
	public HospitalVO getHospitalId(HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null)
			return null;
		return hospitalDao.selectHospital(hospital.getHo_id());
	}

	@Override
	public SiteManagement ajaxHospitalId(String site_id) {

		return hospitalDao.selectSiteId(site_id);
	}

	@Override
	public SiteManagement ajaxHospitalPhone(String site_phone) {

		return hospitalDao.selectHospitalPhone(site_phone);
	}

	@Override
	public SiteManagement ajaxHospitalEmail(String site_email) {

		return hospitalDao.selectHospitalEmail(site_email);
	}

	@Override
	public String ctfEmail(String email) {
		// 임시 새 비밀번호를 생성
		String ctfEmail = randomString(10);

		// 이메일을 전송
		String title = "이메일 인증 입니다.";
		String content = "인증 번호는 <b>" + ctfEmail + "</b> 입니다.";
		boolean res = mailSend(email, title, content);
		if (res) {
			return ctfEmail;
		} else {
			return null;
		}
	}

	public boolean mailSend(String email, String title, String content) {

		String setfrom = "jom470702@gmail.com";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom);// 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(email);// 받는사람 이메일
			messageHelper.setSubject(title);// 메일제목은 생략이 가능하다
			messageHelper.setText(content, true);// 메일 내용, (,true) : 내용에 html 코드가 들어가면 문자열이 아니라 html 코드로 들어간다

			mailSender.send(message);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override // 이용중인 병원들만 조회하는 메서드 : 정경호
	public ArrayList<HospitalVO> hospitalList(Criteria cri) {
		if (cri == null) {
			return null;
		}
		return hospitalDao.hospitalList(cri);
	}

	@Override // 정경호 페이지네이션
	public int getHospitalCount(Criteria cri) {
		if (cri == null) {
			return 0;
		}
		return hospitalDao.selectHospitalCount(cri);
	}
	// 관리자 병원 관리 =========================================================

	@Override
	public ArrayList<HospitalVO> getWaitHoList() {
		return hospitalDao.selectWaitHoList();
	}

	@Override
	public ArrayList<SiteManagement> getRpHoList() {
		return hospitalDao.selectRpHoList();
	}

	@Override
	public ArrayList<HospitalVO> getWaitHospitalList(Criteria cri) {
		if (cri == null) {
			return null;
		}
		return hospitalDao.selectWaitHospitalList(cri);
	}

	@Override
	public int getWHTotalCount(Criteria cri) {
		if (cri == null) {
			return 0;
		}
		return hospitalDao.selectWHTotalCount(cri);
	}

	@Override
	public boolean hospitalWaitOk(HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null || hospital.getHo_id().length() == 0) {
			return false;
		}
		return hospitalDao.updateWaitOk(hospital.getHo_id());
	}

	@Override
	public boolean hospitalWaitNo(HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null || hospital.getHo_id().length() == 0) {
			return false;
		}
		return hospitalDao.updateWaitNo(hospital.getHo_id());
	}

	@Override
	public ArrayList<SiteManagement> getReportHospitalList(Criteria cri) {
		if (cri == null) {
			return null;
		}
		return hospitalDao.selectReportHospitalList(cri);
	}

	@Override
	public int getRHTotalCount(Criteria cri) {
		if (cri == null) {
			return 0;
		}
		return hospitalDao.selectRHTotalCount(cri);
	}

	@Override
	public boolean hospitalOut(HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null || hospital.getHo_id().length() == 0) {
			return false;
		}
		boolean res1 = hospitalDao.deleteHospital(hospital.getHo_id());
		boolean res2 = hospitalDao.deleteSite(hospital.getHo_id());
		if (res1 && res2) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean hospitalStop(ReportVO report) {
		LocalDate localdate = LocalDate.now();
		Date now = java.sql.Date.valueOf(localdate);

		if (report == null || report.getRp_rs_name() == null || report.getRp_rs_name().length() == 0) {
			return false;
		}
		SiteManagement user = hospitalDao.selectHospitalReportTarget(report.getRp_target());
		String id = user.getSite_id();
		// 정지값이 null인지 확인해서
		HospitalVO ho = hospitalDao.selectHospital(id);
		// null 이면
		if (ho.getHo_stop() == null) {
			return hospitalDao.updateHospitalStop(id, report.getRp_rs_name());
		}
		// 아니면
		// 1. ho_stop이 현재시간 이후이면 이미 있던 ho_stop + 정지일
		if (ho.getHo_stop().after(now)) {
			return hospitalDao.updateHospitalStopPlus(id, report.getRp_rs_name());
		}
		// 2. ho_stop이 현재시간 이전이면 데이터 새로 넣기.
		return hospitalDao.updateHospitalStop(id, report.getRp_rs_name());
	}

	@Override
	public String hoStopCancel(HospitalVO ho) {
		LocalDate localdate = LocalDate.now();
		Date now = java.sql.Date.valueOf(localdate);
		if (ho.getHo_stop().before(now)) {
			hospitalDao.updateHoStopCancel(ho.getHo_id());
			return "cancel";
		} else {
			return "stop";
		}
	}

	public ArrayList<HospitalSubjectVO> selectSubject() {
		return hospitalDao.selectHospitalSubjectListHome();
	}
	
	@Override
	public ArrayList<HospitalSubjectVO> selectSubjectAll() {
		return hospitalDao.selectHoSubListAll();
	}

	// 병원 상세 페이지 - 선진, 민석 ==============================================
	@Override
	public boolean insertDetail(HospitalDetailVO detail, HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null) {
	        return false;
	    }

	    detail.setHd_ho_id(hospital.getHo_id());
	    HospitalDetailVO selectedDetail = hospitalDao.selectHoDetail(hospital);

	    if (selectedDetail == null) {
	        hospitalDao.insertHoDetail(hospital, detail);
	    } else {
	        hospitalDao.updateHoDetail(hospital.getHo_id(), detail);
	    }

	    ArrayList<HsListVO> selectedSubjects = hospitalDao.selectSubjects(hospital);
	    ArrayList<Integer> hsLists = detail.getHsList();

	    // 추가 작업
	    for (Integer hs : hsLists) {
	        boolean found = false;
	        for (HsListVO selectedSubject : selectedSubjects) {
	            if (selectedSubject.getHsl_hs_num() == hs) {
	                found = true;
	                break;
	            }
	        }
	        if (!found) {
	            hospitalDao.insertSubjects(hospital, hs);
	        }
	    }

	    // 삭제 작업
	    for (HsListVO selectedSubject : selectedSubjects) {
	        if (!hsLists.contains(selectedSubject.getHsl_hs_num())) {
	            hospitalDao.deleteSubjects(hospital, selectedSubject.getHsl_hs_num());
	        }
	    }

	    return true;
	}

	@Override
	public HospitalVO getHospitalInfo() {
		return hospitalDao.selectHospitalInfo();
	}

	public HospitalSubjectVO getSelectedSubject(HospitalDetailVO detail, HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null) {
			return null;
		}
		return hospitalDao.selectSelectedSubject(detail);
	}

	@Override
	public HospitalDetailVO getHoDetail(HospitalDetailVO detail, HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null) {
			return null;
		}
		if (detail == null) {
			return null;
		}
		return hospitalDao.selectHoDetail(hospital);
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(Criteria cri, HospitalDetailVO detail) {
		if (cri == null) {
			return null;
		}
		return hospitalDao.selectReviewList(cri, detail);
	}

	@Override
	public int getTotalReviewCount(Criteria cri) {
		if (cri == null) {
			return 0;
		}
		return hospitalDao.selectTotalReviewCount(cri);
	}

	public ArrayList<HospitalVO> getArrHospital(SiteManagement user) {
		if (user == null || user.getSite_id() == null || user.getSite_id().length() == 0)
			return null;

		return hospitalDao.getArrHospital(user);
	}

	@Override
	public LandVO getLand(int emd_num) {
		return hospitalDao.getLand(emd_num);
	}

	@Override
	public String insertReview(ReviewVO review, MemberVO member, HospitalDetailVO ho) {
		SiteManagement site = memberDao.selectMyIddd(member.getMe_id());
		if (review == null || review.getVw_content().length() == 0)
			return "리뷰널";
		if (member == null || member.getMe_id() == null)
			return "회원널";
		if (ho.getHd_ho_id() == null || ho.getHd_ho_id().length() == 0)
			return "병원널";
		if (site.getSite_authority().equals("MANAGER"))
			return "사업자";
		int reservation = memberDao.getMemberReservation(member.getMe_id(), ho);
		int dbReview = memberDao.selectReviews(member.getMe_id(), ho);
		if (reservation == 0)
			return "예약널";
		if (dbReview == reservation)
			return "초과";
		review.setVw_me_id(member.getMe_id());
		if (!hospitalDao.insertReview(review))
			return "실패";
		return "성공";
	}

	@Override
	public HospitalDetailVO getDetail(String ho_id) {
		if (ho_id == null || ho_id.length() == 0) {
			return null;
		}
		return hospitalDao.selectDetail(ho_id);
	}

	@Override
	public ArrayList<HospitalSubjectVO> getDetailSubject(String hd_ho_id) {
		return hospitalDao.selectDetailSubject(hd_ho_id);
	}

	public boolean insertLand(LandVO land) {
		if (land == null)
			return false;
		if (hospitalDao.selectLand(land) == null)
			return hospitalDao.insertLand(land);
		return true;
	}

	@Override
	public LandVO getLandLand(LandVO land) {
		if (land == null)
			return null;
		if (hospitalDao.selectLand(land) == null) {
			hospitalDao.insertLand(land);
			return hospitalDao.selectLand(land);
		}
		return hospitalDao.selectLand(land);
	}

	@Override
	public ArrayList<ReviewVO> getCriReviewList(Criteria cri) {
		if (cri == null) {
			return null;
		}
		return hospitalDao.selectCriReviewList(cri);

	}

	@Override
	public ArrayList<HospitalVO> getBmkList(SiteManagement user, Criteria cri) {
		if (user == null || user.getSite_id() == null || user.getSite_id().length() == 0)
			return null;
		return hospitalDao.selectBmkList(user, cri);
	}

	@Override
	public int getBmkListCount(SiteManagement user, Criteria cri) {
		if (user == null || user.getSite_id() == null || user.getSite_id().length() == 0)
			return -1;
		return hospitalDao.selectBmkListCount(user, cri);
	}

	public boolean deleteReview(ReviewVO review, MemberVO member) {
		if (review == null) {
			return false;
		}
		if (member == null || member.getMe_id() == null) {
			return false;
		}
		// 작성자인지 DB와 확인
		ReviewVO dbReview = hospitalDao.selectReview(review.getVw_num());
		if (dbReview == null || !dbReview.getVw_me_id().equals(member.getMe_id())) {
			return false;
		}

		// 다 확인 되면 삭제
		return hospitalDao.deleteReview(review.getVw_num());
	}

	@Override
	public boolean updateReview(ReviewVO review, MemberVO member) {
		if (review == null || review.getVw_content() == null) {
			return false;
		}
		if (member == null || member.getMe_id() == null) {
			return false;
		}
		// 작성자인지 확인
		ReviewVO dbReview = hospitalDao.selectReview(review.getVw_num());
		if (dbReview == null || !dbReview.getVw_me_id().equals(member.getMe_id())) {
			return false;
		}
		// 다 확인되면 업데이트
		return hospitalDao.updateReview(review);
	}

	@Override
	public HospitalVO getHsNum(HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null) {
			return null;
		}
		return hospitalDao.selectHsNum(hospital);
	}

	@Override
	public ArrayList<HsListVO> getSubjects(HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null) {
			return null;
		}
		return hospitalDao.selectSubjects(hospital);
	}

	@Override
	public HospitalDetailVO getHospitalDetail(HospitalVO hospital) {
		if (hospital == null) {
			return null;
		}
		return hospitalDao.selectHoDetail(hospital);
	}

	public ArrayList<HospitalVO> getSubHoList(MemberVO me, LandVO land, Criteria cri) {
		if (me == null || land == null || cri == null)
			return null;

		return hospitalDao.getSubHoList(me, land, cri);
	}

	@Override
	public int getLikeSub(MemberVO me, LandVO land, Criteria cri) {
		if (me == null || land == null || cri == null)
			return -1;

		return hospitalDao.getTotalSubHoList(me, land, cri);
	}

	@Override
	public ArrayList<HospitalVO> getHospitalEmd(LandVO land, int hs_num, Criteria cri) {
		if (land == null || cri == null)
			return null;
		return hospitalDao.getHospitalList(land, cri, hs_num);
	}

	@Override
	public int getHospitalCountEmd(LandVO land, int hs_num, Criteria cri) {
		if (land == null || cri == null)
			return -1;
		return hospitalDao.getHospitalListCount(land, cri, hs_num);
	}

	@Override
	public void getHospitalSubAll(int hs_num) {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<HospitalVO> getHospitalSubAll(LandVO land, Criteria cri) {
		if (land == null || cri == null)
			return null;

		return hospitalDao.selectHospitalAll(land, cri);
	}

	@Override
	public int getHospitalSubAllCount(LandVO land, Criteria cri) {
		if (land == null || cri == null)
			return -1;

		return hospitalDao.selectHospitalAllCount(land, cri);
	}

	@Override
	public HospitalSubjectVO getSubject(HospitalVO huser) {
		if (huser == null || huser.getHo_id() == null) {
			return null;
		}
		return hospitalDao.selectSubject(huser);
	}

	@Override
	public LandVO getMyLand(HospitalVO huser) {
		if (huser == null || huser.getHo_id() == null) {
			return null;
		}
		return hospitalDao.selectMyLand(huser);
	}

	@Override
	public String getSdName(LandVO land) {
		if (land == null) {
			return null;
		}
		return hospitalDao.selectSdName(land);
	}

	@Override
	public String getSggName(LandVO land) {
		if (land == null) {
			return null;
		}
		return hospitalDao.selectSggName(land);
	}

	@Override
	public String getEmdName(LandVO land) {
		if (land == null) {
			return null;
		}
		return hospitalDao.selectEmdName(land);
	}

	@Override
	public HospitalVO getHo(HospitalVO hospital) {
		if (hospital == null || hospital.getHo_id() == null) {
			return null;
		}
		return hospitalDao.selectHospital(hospital.getHo_id());
	}

	@Override
	public boolean updateName(SiteManagement user, HospitalVO hospital) {
		if (user == null || hospital == null || hospital.getHo_name() == null || hospital.getHo_name().isEmpty()) {
			return false;
		}

		HospitalVO dbHospital = hospitalDao.selectHospitalId(user.getSite_id());
		if (dbHospital == null || !dbHospital.getHo_id().equals(user.getSite_id())) {
			return false;
		}
		return hospitalDao.updateName(hospital);
	}

	@Override
	public boolean updateCEO(SiteManagement user, HospitalVO hospital) {
		if (user == null || hospital == null || hospital.getHo_ceo() == null || hospital.getHo_ceo().isEmpty()) {
			return false;
		}

		HospitalVO dbHospital = hospitalDao.selectHospitalId(user.getSite_id());
		if (dbHospital == null || !dbHospital.getHo_id().equals(user.getSite_id())) {
			return false;
		}
		return hospitalDao.updateCEO(hospital);
	}

	@Override
	public boolean updatePhone(SiteManagement user, HospitalVO hospital) {
		if (user == null || hospital == null || hospital.getHo_phone() == null || hospital.getHo_phone().isEmpty()) {
			return false;
		}

		HospitalVO dbHospital = hospitalDao.selectHospitalId(user.getSite_id());
		if (dbHospital == null || !dbHospital.getHo_id().equals(user.getSite_id())) {
			return false;
		}
		return hospitalDao.updatePhone(hospital);
	}

	@Override
	public boolean updateEmail(SiteManagement user, HospitalVO hospital) {
		if (user == null || hospital == null || hospital.getHo_email() == null || hospital.getHo_email().isEmpty()) {
			return false;
		}

		HospitalVO dbHospital = hospitalDao.selectHospitalId(user.getSite_id());
		if (dbHospital == null || !dbHospital.getHo_id().equals(user.getSite_id())) {
			return false;
		}
		return hospitalDao.updateEmail(hospital);
	}

	@Override
	public boolean updateDetailAddress(SiteManagement user, HospitalVO hospital) {
		if (user == null || hospital == null || hospital.getHo_address() == null
				|| hospital.getHo_address().isEmpty()) {
			return false;
		}
		HospitalVO dbHospital = hospitalDao.selectHospitalId(user.getSite_id());
		if (dbHospital == null || !dbHospital.getHo_id().equals(user.getSite_id())) {
			return false;
		}
		return hospitalDao.updateDetailAddress(hospital);
	}

	@Override
	public HospitalVO getHoId(String ho_id) {
		return hospitalDao.selectHospitalId(ho_id);
	}

	@Override
	public boolean updatePw(SiteManagement user, String ho_id, String oldPw, String newPw) {
		if (user == null || ho_id == null) {
			return false;
		}

		HospitalVO dbHospital = hospitalDao.selectHospitalId(user.getSite_id());
		if (dbHospital == null || !dbHospital.getHo_id().equals(user.getSite_id())) {
			return false;
		}

		// 입력한 비밀번호와 저장된 암호화된 비밀번호를 비교하여 일치 여부 확인
		if (!passwordEncoder.matches(oldPw, dbHospital.getHo_pw())) {
			return false;
		}

		String encPw = passwordEncoder.encode(newPw);
		// 비밀번호 업데이트
		boolean res = hospitalDao.updatePw(encPw, ho_id);
		if (!res) {
			return false;
		}
		return true;
	}

	@Override
	public boolean updateSubject(SiteManagement user, HospitalVO ho, int hs_num) {
		if (ho == null || ho.getHo_id() == null) {
			return false;
		}

		HospitalVO dbHospital = hospitalDao.selectHospitalId(user.getSite_id());
		if (dbHospital == null || !dbHospital.getHo_id().equals(user.getSite_id())) {
			return false;
		}

		return hospitalDao.updateSubject(ho.getHo_id(), hs_num);
	}

	@Override
	public LandVO getWholeLand(LandVO land) {
		if (land == null)
			return null;
		if (hospitalDao.selectLand(land) == null) {
			hospitalDao.insertLand(land);
			return hospitalDao.selectLand(land);
		}
		return hospitalDao.selectLand(land);
	}

	@Override
	public boolean updateAddress(SiteManagement user, HospitalVO ho, LandVO la) {
		if (ho == null || ho.getHo_id() == null || la == null || user == null || user.getSite_id() == null
				|| user.getSite_id().length() == 0 || ho.getHo_id().length() == 0)
			return false;

		HospitalVO dbHospital = hospitalDao.selectHospitalId(user.getSite_id());
		if (dbHospital == null || !dbHospital.getHo_id().equals(user.getSite_id())) {
			return false;
		}

		// sitemanagement도 수정해야됨
		boolean hospitalLand = hospitalDao.updateHospitalLand(ho, la);
		boolean siteLand = hospitalDao.updateSiteLand(user, la);
		if (hospitalLand && siteLand) {
			return hospitalLand && siteLand;
		}

		return false;
	}

	@Override
	public ArrayList<SiGoonGuVO> getSgg(int sd_num) {
		return hospitalDao.selectSgg(sd_num);
	}

	@Override
	public ArrayList<EupMyeonDongVO> getEmd(int sgg_num) {
		return hospitalDao.selectEmd(sgg_num);
	}

	@Override
	public HospitalDetailVO getDetailId(int hd_num) {
		return hospitalDao.selectDetailId(hd_num);
	}

	@Override
	public LandVO getHoLand(int ho_la_num) {
		return hospitalDao.selectHoLand(ho_la_num);
	}

	@Override
	public SiDoVO getHdSiDoName(int la_sd_num) {
		return hospitalDao.selectHdSiDoName(la_sd_num);
	}

	@Override
	public SiGoonGuVO getHdSggName(int la_sgg_num) {
		return hospitalDao.selectHdSggName(la_sgg_num);
	}

	@Override
	public EupMyeonDongVO getHdEmdName(int la_emd_num) {
		return hospitalDao.selectHdEmdName(la_emd_num);
	}

	@Override
	public HospitalVO getHospitalMypage(SiteManagement user) {
		if (user == null || user.getSite_id() == null) {
			return null;
		}
		return hospitalDao.selectHospitalPage(user.getSite_id());
	}

	@Override
	public HospitalDetailVO getHospitalDetail(String po_id) {
		if (po_id == null || po_id.length() == 0) {
			return null;
		}
		return hospitalDao.selectHospitalDetail(po_id);
	}

	@Override
	public HospitalProgramVO getHospitalProgram(int hp_num) {
		return hospitalDao.selectHospitalProgram(hp_num);
	}

	@Override
	public boolean deleteMyInfo(HospitalVO hospital, SiteManagement user) {
		if (hospital == null || user == null) {
			return false;
		}

		boolean deleteHospital = hospitalDao.deleteHospital(hospital.getHo_id());
		boolean deleteSite = hospitalDao.deleteSiteHospital(user.getSite_id());
		return deleteHospital && deleteSite;
	}

	@Override
	public boolean insertHoSub(String ho_id, int ho_hs_num) {

		return hospitalDao.insertHoSub(ho_id, ho_hs_num);
	}

	@Override
	public ArrayList<HospitalVO> getMyAreaHospitalList(int site_la_num) {
		return hospitalDao.selectMyAreaHospitalList(site_la_num);
	}

	@Override
	public ArrayList<ReservationVO> selectAllReservationList() {
		return hospitalDao.selectAllReservationList();
	}

	@Override
	public HospitalDetailVO getDetailHoId() {
		return hospitalDao.selectDetailHoId();
	}

	@Override
	public HospitalDetailVO getHospitalDetail(int vw_hd_num) {
		return hospitalDao.selectHospitalDet(vw_hd_num);
	}

	@Override
	public List<HospitalSubjectVO> getHoSubAutoList(String value) {
		return hospitalDao.selectHoSubAutoList(value);
	}



}
