package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.BookmarkVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface MemberService {

	boolean memberSignup(MemberVO member, LandVO getLand);

	boolean siteSignup(SiteManagement site, LandVO getLand);

	SiteManagement login(MemberVO member);

	ArrayList<SiDoVO> getSiDo();

	ArrayList<SiGoonGuVO> getSgg(int sd_num);

	ArrayList<EupMyeonDongVO> getEmd(int sgg_num);

	void setLoginFail(String me_id);

	MemberVO getMember(MemberVO member);

    //아이디 중복확인 ajax
	SiteManagement getMemberId(SiteManagement site);
	//이메일 중복확인 ajax
	SiteManagement getMemberEmail(SiteManagement site);
	//폰번호 중복확인 ajax
	SiteManagement getMemberPhone(SiteManagement site);

	//관리자 페이지 - 회원 관리(양선진)
	ArrayList<MemberVO> getMemberList(Criteria cri);

	int getMemberTotalCount(Criteria cri);

	boolean deleteMember(MemberVO member);

	ArrayList<SiteManagement> getReportMemberList(Criteria cri);

	int getReportMemberTotalCount(Criteria cri);

	boolean stopMember(ReportVO report);

	MemberVO getMemberInfo(SiteManagement user);

	boolean updateName(SiteManagement user, MemberVO member);

	boolean updatePhone(SiteManagement user, MemberVO member);

	boolean updateEmail(SiteManagement user, MemberVO member);

	boolean updatePw(SiteManagement user, String me_id, String oldPw, String newPw);


	MemberVO getMemberPassword(MemberVO member, SiteManagement user);

	MemberVO getMeId(String me_id);

	boolean insertLand(LandVO land);

	LandVO getLand(LandVO land);

	LandVO getMyLand(MemberVO muser);

	String getSdName(LandVO land);

	String getSggName(LandVO land);

	String getEmdName(LandVO land);

	boolean updateAddress(SiteManagement user, MemberVO me, LandVO la);

	boolean updateSubject(SiteManagement user, MemberVO me, int hs_num);

	HospitalSubjectVO getSubject(MemberVO muser);

	LandVO getMyLand(SiteManagement user);

	MemberVO getSiteMember(SiteManagement user);

	boolean insertBookmark(BookmarkVO bookmark, MemberVO member);

	boolean deleteBookmark(BookmarkVO bookmark, MemberVO member);

	boolean selectBookmark(BookmarkVO bookmark, MemberVO member);

	boolean selectDetailBookmark(BookmarkVO bookmark, MemberVO member, String hd_ho_id);

	boolean deleteMyInfo(MemberVO member, SiteManagement user);

	ArrayList<ReportVO> getMeRpList();

	ArrayList<MemberVO> getMemberLand();

	boolean getReservationId(String ho_id, MemberVO member);

	void updateMemberCookie(SiteManagement user);

	SiteManagement getMemberByCookie(String sessionId);

	boolean findPw(String id);

	boolean findId(String email, String phone);

	SiteManagement getSiteUser(String email);

}
