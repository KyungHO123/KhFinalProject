package kr.kh.team3.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.HospitalDAO;
import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.BookmarkVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.ReservationVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImp implements MemberService {
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	HospitalDAO hospitalDao;

	@Autowired
	private JavaMailSender mailSender;
	
	//새 비밀번호 생성
	private String randomPassword1(int size) {
		String strs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#";
		String newPw = "";
		int min = 0, max = strs.length() - 1;
		while(newPw.length() < size) {
			int r = (int)(Math.random() * (max - min + 1) + min);
			newPw += strs.charAt(r);
		}
		return newPw;
	}

	public boolean mailSend(String email, String title, String content) {

		String setfrom = "gksrbqmffn@gmail.com";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom);// 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(email);// 받는사람 이메일
			messageHelper.setSubject(title);// 메일제목은 생략이 가능하다
			messageHelper.setText(content, true);// 메일 내용

			mailSender.send(message);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private boolean checkString(String str) {
		return str != null && str.length() != 0;
	}

	public boolean memberSignup(MemberVO member, LandVO getLand) {
		if (member == null || getLand == null)
			return false;

		MemberVO user = memberDao.selectMember(member.getMe_id());
		if (user != null)
			return false;
		if (member.getMe_pw() == null || member.getMe_pw().length() == 0)
			return false;
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);

		try {
			return memberDao.insertMember(member, getLand);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean siteSignup(SiteManagement site, LandVO getLand) {
		return memberDao.insertSiteMember(site, getLand);
	}

	@Override
	public SiteManagement login(MemberVO member) {
		// 매개변수 null 처리
		if (member == null || member.getMe_id() == null || member.getMe_pw() == null)
			return null;
		// 아이디 확인
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if (user == null) {
			return null;

		}
		// 비번 확인
		// 맞으면 site 정보 return
		if (passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			memberDao.updateLoginFailZero(user.getMe_id());

			return memberDao.selectSite(user.getMe_id());
		}
		return null;
	}

	@Override
	public ArrayList<SiDoVO> getSiDo() {
		return memberDao.selectSiDo();
	}

	@Override
	public ArrayList<SiGoonGuVO> getSgg(int sd_num) {
		return memberDao.selectSgg(sd_num);
	}

	@Override
	public ArrayList<EupMyeonDongVO> getEmd(int sggNum) {
		return memberDao.selectEmd(sggNum);
	}

	@Override
	public void setLoginFail(String me_id) {
		memberDao.updateLoginFail(me_id);
	}

	@Override
	public MemberVO getMember(MemberVO member) {
		if (member == null || member.getMe_id() == null)
			return null;
		return memberDao.selectMember(member.getMe_id());
	}

	@Override
	public SiteManagement getMemberId(SiteManagement site) {
		if (site == null || site.getSite_id() == null || site.getSite_id().isEmpty()) {
			return null;
		}

		// 입력된 아이디로 회원 조회
		SiteManagement ho = memberDao.selectSite(site.getSite_id());
		// user가 null이 아니면 중복
		if (ho != null) {
			return ho;
		}

		return null;
	}

	@Override
	public SiteManagement getMemberEmail(SiteManagement site) {
		if (site == null || site.getSite_email() == null || site.getSite_email().isEmpty()) {
			return null;
		}
		// 입력된 이메일로 회원 조회
		SiteManagement user = memberDao.selectMemberEmail(site.getSite_email());
		// user가 null이 아니면 중복
		if (user != null) {
			return user;
		}

		return null;
	}

	@Override
	public SiteManagement getMemberPhone(SiteManagement site) {
		if (site == null || site.getSite_phone() == null || site.getSite_phone().isEmpty()) {
			return null;
		}
		// 입력된 폰번호로 회원 조회
		SiteManagement user = memberDao.selectMemberPhone(site.getSite_phone());
		// user가 null이 아니면 중복
		if (user != null) {
			return user;
		}

		return null;
	}

	// 관리자 - 회원 관리
	@Override
	public ArrayList<MemberVO> getMemberList(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return memberDao.selectMemberList(cri);
	}

	@Override
	public int getMemberTotalCount(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return memberDao.selectMemberTotalCount(cri);
	}

	@Override
	public ArrayList<SiteManagement> getReportMemberList(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return memberDao.selectReportMemberList(cri);
	}

	@Override
	public int getReportMemberTotalCount(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return memberDao.selectReportMemberTotalCount(cri);
	}

	@Override
	public boolean deleteMember(MemberVO member) {
		if (member == null) {
			return false;
		}

		// member id와 같은 site_management의 아이디를 가져옴
		SiteManagement stId = memberDao.selectSiteMemberId(member.getMe_id());

		// 사이트 아이디가 비었거나 멤버의 아이디와 같지 않으면 false
		if (stId == null || !member.getMe_id().equals(stId.getSite_id())) {
			return false;
		}

		// 같으면 member와 site_management 둘 다 삭제
		if (member.getMe_id().equals(stId.getSite_id())) {
			boolean deleteMember = memberDao.deleteMember(member.getMe_id());
			boolean deleteSiteManagement = memberDao.deleteSiteManagement(stId.getSite_id());

			return deleteMember && deleteSiteManagement;
		}

		return false;
	}

	@Override
	public boolean stopMember(ReportVO report) {
		LocalDate localdate = LocalDate.now();
		Date now = java.sql.Date.valueOf(localdate);
		if (report == null || report.getRp_rs_name() == null || report.getRp_rs_name().length() == 0) {
			return false;
		}

		// ReportVO객체의 rp_target을 넣어서 member 생성
		SiteManagement user = memberDao.selectSiteMember(report.getRp_target());
		String id = user.getSite_id();
		MemberVO member = memberDao.selectMember(id);
		// member의 정지기간이 null이면
		if (member.getMe_stop() == null) {
			return memberDao.updateStopMember(id, report.getRp_rs_name());
		}

		// 이미 정지기간이면 + 이미 있는 me_stop + 정지일
		if (member.getMe_stop().after(now)) {
			return memberDao.updatePlusStopMember(id, report.getRp_rs_name());
		}

		// ho_stop이 현재시간 이전이면 새데이터 넣기
		return memberDao.updateStopMember(id, report.getRp_rs_name());
	}

	@Override
	public MemberVO getMemberInfo(SiteManagement user) {
		if (user == null || user.getSite_id() == null) {
			return null;
		}
		return memberDao.getMemberInfo(user.getSite_id());
	}

	@Override // 이름 수정
	public boolean updateName(SiteManagement user, MemberVO member) {
		if (user == null || member == null || member.getMe_name() == null || member.getMe_name().isEmpty()
				|| member.getMe_name().length() == 0)
			return false;
		MemberVO dbMember = memberDao.selectMember(user.getSite_id());
		if (dbMember == null || !dbMember.getMe_id().equals(user.getSite_id()))
			return false;

		return memberDao.updateName(member);
	}

	@Override // 폰번호 수정
	public boolean updatePhone(SiteManagement user, MemberVO member) {
		if (user == null || member == null || member.getMe_phone() == null || member.getMe_phone().isEmpty()
				|| member.getMe_phone().length() == 0)
			return false;
		MemberVO dbMember = memberDao.selectMember(user.getSite_id());
		if (dbMember == null || !dbMember.getMe_id().equals(user.getSite_id()))
			return false;

		return memberDao.updatePhone(member);
	}

	@Override // 이메일 수정
	public boolean updateEmail(SiteManagement user, MemberVO member) {
		if (user == null || member == null || member.getMe_email() == null || member.getMe_email().isEmpty()
				|| member.getMe_email().length() == 0)
			return false;
		MemberVO dbMember = memberDao.selectMember(user.getSite_id());
		if (dbMember == null || !dbMember.getMe_id().equals(user.getSite_id()))
			return false;

		return memberDao.updateEmail(member);
	}


	@Override // 비번 수정
	public boolean updatePw(SiteManagement user, String me_id, String oldPw, String newPw) {
		// 사용자 정보나 회원 정보가 null이거나 비밀번호가 비어 있으면 수정하지 않음
		if (user == null || me_id == null) {
			return false;
		}

		// 데이터베이스에서 해당 회원 정보 조회
		MemberVO dbMember = memberDao.selectMember(user.getSite_id());
		if (dbMember == null || !dbMember.getMe_id().equals(user.getSite_id())) {
			return false;
		}

		// 입력한 비밀번호와 저장된 암호화된 비밀번호를 비교하여 일치 여부 확인
		// 왼쪽이 입력한 값 오른쪽이 디비 값
		if (!passwordEncoder.matches(oldPw, dbMember.getMe_pw())) {
			return false;
		}
		String encPw = passwordEncoder.encode(newPw);
		// 비밀번호 업데이트
		boolean res = memberDao.updatePw(encPw, me_id);
		if (!res) {
			return false;
		}
		return true; // 비밀번호 업데이트 성공

	}

	@Override
	public MemberVO getMemberPassword(MemberVO member, SiteManagement user) {
		if (user == null || member == null)
			return null;
		MemberVO dbMember = memberDao.selectMember(user.getSite_id());
		if (dbMember == null || !dbMember.getMe_id().equals(user.getSite_id()))
			return null;

		return memberDao.selectMember(member.getMe_id());
	}

	@Override
	public MemberVO getMeId(String me_id) {
		log.info(me_id);
		return memberDao.getMemberInfo(me_id);
	}

	@Override
	public boolean insertLand(LandVO land) {
		if (land == null)
			return false;
		if (memberDao.selectLand(land) == null)
			return memberDao.insertLand(land);
		return true;
	}

	@Override
	public LandVO getLand(LandVO land) {
		if (land == null)
			return null;
		if (memberDao.selectLand(land) == null) {
			memberDao.insertLand(land);
			return memberDao.selectLand(land);
		}
		return memberDao.selectLand(land);

	}

	@Override
	public LandVO getMyLand(MemberVO muser) {
		return memberDao.getMyLand(muser);
	}

	@Override
	public String getSdName(LandVO land) {
		if (land == null)
			return null;

		return memberDao.selectSdName(land);

	}

	@Override
	public String getSggName(LandVO land) {
		if (land == null) {
			return null;
		}
		return memberDao.selectSggName(land);
	}

	@Override
	public String getEmdName(LandVO land) {
		if (land == null)
			return null;

		return memberDao.selectEmdName(land);
	}

	@Override
	public boolean updateAddress(SiteManagement user, MemberVO me, LandVO la) {
		if (me == null || me.getMe_id() == null || la == null || user == null || user.getSite_id() == null
				|| user.getSite_id().length() == 0 || me.getMe_id().length() == 0)
			return false;

		MemberVO dbMember = memberDao.selectMember(user.getSite_id());
		if (dbMember == null || !dbMember.getMe_id().equals(user.getSite_id()))
			return false;
		// sitemanagement도 수정해야됨
		boolean memberLand = memberDao.updateMemberLand(me, la);
		boolean siteLand = memberDao.updateSiteLand(user, la);
		if (memberLand && siteLand)
			return memberLand && siteLand;

		return false;
	}

	@Override
	public boolean updateSubject(SiteManagement user, MemberVO me, int hs_num) {
		if (me == null || me.getMe_id() == null)
			return false;
		MemberVO dbMember = memberDao.selectMember(user.getSite_id());
		if (dbMember == null || !dbMember.getMe_id().equals(user.getSite_id()))
			return false;

		return memberDao.updateSubject(me.getMe_id(), hs_num);
	}

	@Override
	public HospitalSubjectVO getSubject(MemberVO muser) {
		if (muser == null || muser.getMe_id() == null)
			return null;

		return memberDao.selectSubject(muser);
	}

	@Override
	public LandVO getMyLand(SiteManagement user) {
		if (user == null || user.getSite_id() == null) {
			return null;
		}
		return memberDao.selectMyLand(user.getSite_la_num());
	}

	
	//일반 회원 로그인 세션(양선진)
	@Override
	public MemberVO getSiteMember(SiteManagement user) {
		if(user == null ||
			user.getSite_id() == null) {
			return null;
		}
		return memberDao.selectMember(user.getSite_id());
	}

	@Override
	public boolean insertBookmark(BookmarkVO bookmark, MemberVO member) {
		if(member == null || member.getMe_id() == null) {
			return false;
		}

		System.out.println("memberㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ" + member.getMe_id());
		System.out.println("detailㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ" + bookmark.getBmk_ho_id());
		return memberDao.insertBookmark(member, bookmark.getBmk_ho_id());
	}

	@Override
	public boolean deleteBookmark(BookmarkVO bookmark, MemberVO member) {
		if(member == null || member.getMe_id() == null) {
			return false;
		}
		
		if(bookmark.getBmk_ho_id() == null) {
			return false;
		}
		
		BookmarkVO dbBmk = memberDao.selectBookmark(member.getMe_id(), bookmark.getBmk_ho_id());
		if(dbBmk !=null) {
			return memberDao.deleteBookmark(dbBmk.getBmk_ho_id(), dbBmk.getBmk_me_id());
		}
		
		return true;
	}

	@Override
	public boolean selectBookmark(BookmarkVO bookmark, MemberVO member) {
		if(member == null || member.getMe_id() == null) {
			return false;
		}
		
		if(bookmark.getBmk_ho_id() == null) {
			return false;
		}
		//통과되면 select
		BookmarkVO result = memberDao.selectBookmark(member.getMe_id(), bookmark.getBmk_ho_id());
		System.out.println("memberㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ" + member.getMe_id());
		System.out.println("detailㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ" + bookmark.getBmk_ho_id());
		
		if(result != null) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean selectDetailBookmark(BookmarkVO bookmark, MemberVO member, String hd_ho_id) {
		if(member == null || member.getMe_id() == null) {
			return false;
		}
		
		if(hd_ho_id == null) {
			return false;
		}
		//통과되면 select
		BookmarkVO result = memberDao.selectDetailBookmark(member.getMe_id(), hd_ho_id);
		
		if(result != null) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean deleteMyInfo(MemberVO member, SiteManagement user) {
		if(member == null || user == null)
			return false;
		boolean dbMember =memberDao.deleteMyInfo(user.getSite_id());
		log.info(dbMember+"asdasd123asdasd123asdasd123asdasd123asdasd123asdasd123");
		if(!dbMember)
			return false;
		
		return dbMember;
	}

	@Override
	public ArrayList<ReportVO> getMeRpList() {
		return memberDao.selectMeRpList();
	}

	@Override
	public ArrayList<MemberVO> getMemberLand() {
		return memberDao.selectMemberLand();
	}

	@Override
	public boolean getReservationId(String ho_id, MemberVO member) {
		if(member == null) {
			return false;
		}
		
		int res = memberDao.selectReservationId(ho_id, member.getMe_id());
		if(res == 0) {			
			return false; 
		}
		else {
			return true;
		}
	}

//	자동 로그인 
	@Override
	public void updateMemberCookie(SiteManagement user) {
		if(user == null)
			return;
		memberDao.updateMemberCookie(user);
	}

	@Override
	public SiteManagement getMemberByCookie(String sessionId) {
		return memberDao.selectMemberByCookie(sessionId);
	}

	@Override
	public boolean findPw(String id) {
		SiteManagement user = memberDao.selectUser(id);
		if(user == null) {
			return false;
		}
		//임시 새 비번 생성
		String newPw = randomPassword1(6);
		
		//이메일 전송
		String title = "[병원 중개 사이트] 새 비밀번호 입니다.";
		String content = user.getSite_id() + "님의 새 비밀번호는 <b>" 
						+ newPw + "</b> 입니다.\n 로그인 후 비밀번호를 변경해주세요.";
		boolean res = mailSend(user.getSite_email(), title, content);
		
		//임시 새 비밀번호를 암호화해서 DB에 저장
		String encPw = passwordEncoder.encode(newPw);
		if(user.getSite_authority().equals("USER")) {			
			memberDao.updatePassword(user.getSite_id(), encPw);
		}
		else if(user.getSite_authority().equals("MANAGER")) {
			hospitalDao.updatePassword(user.getSite_id(), encPw);
		}
		else {
			return false;
		}
		
		return res;
	}

	@Override
	public boolean findId(String email, String phone) {
		SiteManagement user = memberDao.selectUserFindId(email, phone);
		if(user == null || user.getSite_email() == null || user.getSite_phone() == null) {
			return false;
		}
		
		//다 맞으면 true
		if(email.equals(user.getSite_email()) && phone.equals(user.getSite_phone())) {
			return true;
		}
		
		return true;
	}

	@Override
	public SiteManagement getSiteUser(String email) {
		return memberDao.selectSiteUser(email);
	}

	

}