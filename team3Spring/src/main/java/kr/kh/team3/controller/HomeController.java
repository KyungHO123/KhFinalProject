package kr.kh.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.ReservationVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.BoardService;
import kr.kh.team3.service.HospitalService;
import kr.kh.team3.service.MemberService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {

	@Autowired
	MemberService memberService;

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private HospitalService hospitalService;
	
	@GetMapping("/")
	public String home(Model model,HttpSession session) {
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		if(user == null) {
			ArrayList<BoardVO> boList = boardService.selectBoard();
			ArrayList<PostVO> poList = boardService.selectHotPostList();
			ArrayList<HospitalSubjectVO> list = hospitalService.selectSubject();
			
			model.addAttribute("poList", poList);
			model.addAttribute("boList", boList);
			model.addAttribute("list", list);
		}
		else {
			ArrayList<HospitalVO> hoList = hospitalService.getMyAreaHospitalList(user.getSite_la_num());
			ArrayList<BoardVO> boList = boardService.selectBoard();
			ArrayList<PostVO> poList = boardService.selectHotPostList();
			ArrayList<PostVO> notice = boardService.selectNoticeList();
			ArrayList<HospitalSubjectVO> list = hospitalService.selectSubject();
			ArrayList<ReservationVO> reList = hospitalService.selectAllReservationList();
			model.addAttribute("notice", notice);
			model.addAttribute("reList", reList);
			model.addAttribute("hoList", hoList);
			model.addAttribute("poList", poList);
			model.addAttribute("boList", boList);
			model.addAttribute("list", list);
		}

		return "home";
	}
	
	@GetMapping("/main/findpw")
	public String findPw() {
		return "/main/findpw";
	}
	
	@ResponseBody
	@PostMapping("/main/findpw")
	public Map<String, Object> findPwPost(@RequestParam("id") String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.findPw(id);
		map.put("result", res);
		return map;
	}
	
	@GetMapping("/main/findid")
	public String findId() {
		return "/main/findid";
	}
	
	@ResponseBody
	@PostMapping("/main/findid")
	public Map<String, Object> findIdPost(@RequestParam("email") String email, @RequestParam("phone") String phone) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.findId(email, phone);
		//이메일과 같은 사람 아이디 주기
		SiteManagement user = memberService.getSiteUser(email);
		
		map.put("result", res);
		map.put("user", user);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/hospital/autocomplete")
	public List<HospitalSubjectVO> autoCompletePost(Model model, String value) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		ArrayList<HospitalSubjectVO> list = 
//		map.put("list", list);
		return hospitalService.getHoSubAutoList(value);
	}
	
	@ResponseBody
	@PostMapping("/hospital/search")
	public List<HospitalSubjectVO> hospitalSearch(Model model) {
		return hospitalService.getHospitalSubjectList();
	}
	
	@ResponseBody
	@PostMapping("/common/header")
	public Map<String, Object> header(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<BoardVO> boList = boardService.selectBoard();
		ArrayList<HospitalSubjectVO> list = hospitalService.selectSubject();
		map.put("boList", boList);
		map.put("list", list);
		return map;
	}

	// 회원가입 메인페이지
	@GetMapping("/main/signup")
	public String mainSignup() {
		return "/main/signup";
	}
	
	@ResponseBody
	@GetMapping("/footer")
	public Map<String, Object> noticeList() {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<PostVO> notice = boardService.selectNoticeList();
		map.put("notice", notice);
		return map;
	}

	// 개인 회원가입 페이지 GET
	@GetMapping("/member/signup")
	public String memberSignup(Model model, SiDoVO sido, SiGoonGuVO sgg, EupMyeonDongVO emd,
			String email) {
		ArrayList<HospitalSubjectVO> list = hospitalService.getHospitalSubjectList();
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("list", list);
		model.addAttribute("email", email);
		return "/member/signup";
	}

	// 개인 회원가입 페이지 POST
	@ResponseBody
	@PostMapping("/member/signup")
	public boolean postPemberSignup(MemberVO member, SiteManagement site, LandVO land) {
		boolean addLand = memberService.insertLand(land);
		if (!addLand) {
			return false;
		}
		LandVO getLand = memberService.getLand(land);
		if (getLand == null) {
			return false;
		}
		boolean memberRes = memberService.memberSignup(member, getLand);
		boolean siteRes = memberService.siteSignup(site, getLand);
		return !memberRes || !siteRes;
	}

	@GetMapping("/message")
	public String message(Model model, boolean res) {
		if (res) {
			model.addAttribute("msg", "회원가입에 실패 했습니다.");
			model.addAttribute("url", "/member/signup");
		} else {
			model.addAttribute("msg", "회원가입을 완료했습니다.");
			model.addAttribute("url", "/");
		}
		return "message";
	}

	// 시도 번호를 시군구한테 넘겨줘서 시도에 있는 시군구들을 가져오는 메서드
	@ResponseBody
	@PostMapping("/member/signup/gungoo")
	public ArrayList<SiGoonGuVO> postgoongoo(int sd_num) {
		ArrayList<SiGoonGuVO> sggList = memberService.getSgg(sd_num);
		return sggList;
	}

	// 시군구 번호를 읍면동한테 넘겨줘서 시군구에 있는 읍면동들을 가져오는 메서드
	@ResponseBody
	@PostMapping("/member/signup/eupmyeondong")
	public ArrayList<EupMyeonDongVO> postEupMyeonDong(int sgg_num) {
		ArrayList<EupMyeonDongVO> emdList = memberService.getEmd(sgg_num);
		return emdList;
	}
	
	// 회원가입 이메일 인증 페이지(get)
	@GetMapping("/main/certification")
	public String certification(Model model, int num) {
		model.addAttribute("num", num);
		return "/main/certification";
	}

	// 이메일 인증
	@ResponseBody
	@PostMapping("/certification/email")
	public Map<String, Object> ctfEmailPost(@RequestParam("email") String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		String ctfEmail = hospitalService.ctfEmail(email);
		try {
			map.put("ctfEmail", ctfEmail);
		} catch (Exception e) {

		}
		return map;
	}

	@ResponseBody
	@PostMapping("/certification/num")
	public boolean handleCertification(@RequestParam("newCeNum") String newCeNum, @RequestParam("data") String data) {
		System.out.println("aaaaaaaaaaaaaaaaaaa");
		System.out.println(newCeNum);
		System.out.println(data);
		if (newCeNum.equals(data)) {
			return true;
		} else {
			return false;
		}
	}

	// 사업자 회원가입 페이지(get)
	@GetMapping("/hospital/signup")
	public String hospitalSignup(HospitalVO hospital, Model model, String ho_id, SiDoVO siDo, String email) {
		ArrayList<HospitalSubjectVO> hospitalList = hospitalService.getHospitalSubjectList();
		ArrayList<SiDoVO> sidoList = hospitalService.getSiDoList();
		model.addAttribute("hospitalList", hospitalList);
		model.addAttribute("hospital", hospital);
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("email", email);
		return "/hospital/signup";
	}

	// 사업자 회원가입 페이지(post)
	@ResponseBody
	@PostMapping("/hospital/signup")
	public boolean hospitalSignupPost(
			HospitalVO hospital, SiteManagement site, HospitalSubjectVO hoSub,
			@RequestParam Map<String, String> obj, LandVO land) {
		boolean addLand = hospitalService.insertLand(land);
		if (!addLand) {
			return false;
		}
		LandVO getLand = hospitalService.getLandLand(land);
		if (getLand == null) {
			return false;
		}
		
		boolean memberRes = hospitalService.signup(hospital, getLand);
		boolean siteRes = hospitalService.siteSignup(site, getLand);
		return !memberRes || !siteRes;
	}

	// 로그인 메인 페이지
	@GetMapping("/main/login")
	public String mainLogin(Model model, HttpServletRequest request) {
		//login 페이지로 넘어오기 이전 경로를 가져옴
		String url = request.getHeader("Referer");
		//이전 url에 login이 들어가있는 경우를 제외
		if(url != null 
				&& !url.contains("login") 
				&& !url.contains("findid") 
				&& !url.contains("findpw")) {
			request.getSession().setAttribute("prevUrl", url);
		}
		return "/main/login";
	}

	@PostMapping("/member/login")
	public String memberLoginPost(Model model, MemberVO member) {
		MemberVO me = memberService.getMember(member);
		// 입력한 아이디가 존재하지 않는 아이디일 때
		if (me == null) {
			model.addAttribute("url", "/main/login");
			model.addAttribute("msg", "로그인에 실패했습니다.");
			return "message";
		}
		// 로그인 실패 횟수가 5회일 때
		if (me.getMe_fail() == 5) {
			model.addAttribute("url", "/main/login");
			model.addAttribute("msg", "로그인 시도 횟수 5회를 초과하였습니다. 비밀번호 찾기를 통해 로그인해주세요.");
			return "message";
		}
		// member정보를 주고 아이디 비번 맞는지 확인 후
		SiteManagement user = memberService.login(member);
		if (user != null) {
			user.setAutoLogin(member.isAutoLogin());
			model.addAttribute("user", user);// user라는 이름으로 전송
			model.addAttribute("url", "/");
			model.addAttribute("msg", "로그인이 완료되었습니다.");
		} else {
			memberService.setLoginFail(me.getMe_id());
			model.addAttribute("url", "/main/login");
			if (me.getMe_fail() == 4) {
				model.addAttribute("msg", "로그인에 실패했습니다. 5/5 회 시도하였습니다. 비밀번호 찾기를 통해 로그인해주세요.");
			} else {
				model.addAttribute("msg", "로그인에 실패했습니다. " + (me.getMe_fail() + 1) + "/5 회 시도하였습니다.");
			}
		}
		return "message";
	}

	@PostMapping("/hospital/login")
	public String hospitalLoginPost(Model model, HospitalVO hospital) {
		HospitalVO ho_exist = hospitalService.getHospitalId(hospital);

		// 입력한 아이디가 존재하지 않는 아이디일 때
		if (ho_exist == null) {
			model.addAttribute("url", "/main/login");
			model.addAttribute("msg", "존재하지 않는 아이디입니다.");
			return "message";
		}
		// 로그인 실패 횟수가 5회일 때
		if (ho_exist.getHo_fail() == 5) {
			model.addAttribute("url", "/main/login");
			model.addAttribute("msg", "로그인 시도 횟수 5회를 초과하였습니다. 비밀번호 찾기를 통해 로그인해주세요.");
			return "message";
		}

		// hospital정보를 주고 아이디 비번 맞는지 확인
		SiteManagement user = hospitalService.login(hospital);
		if (user == null) {
			hospitalService.setLoginFail(ho_exist.getHo_id());
			model.addAttribute("url", "/main/login");
			if (ho_exist.getHo_fail() == 4) {
				model.addAttribute("msg", "로그인에 실패했습니다. 5/5 회 시도하였습니다. 비밀번호 찾기를 통해 로그인해주세요.");
			} else {
				model.addAttribute("msg", "로그인에 실패했습니다. " + (ho_exist.getHo_fail() + 1) + "/5 회 시도하였습니다.");
			}
			return "message";
		}

		// 가입 대기 상태 확인하기 위해 hospital 값 가져옴
		HospitalVO ho = hospitalService.getHospital(user);

		if (ho.getHo_ms_state().equals("기간정지")) {
			// 정지기간 지났으면 초기화 후 권한 변경
			String res = hospitalService.hoStopCancel(ho);
			if (res.equals("cancel")) {
				user.setAutoLogin(hospital.isAutoLogin());
				model.addAttribute("user", user);// user라는 이름으로 전송
				model.addAttribute("url", "/");
				model.addAttribute("msg", "기간 정지가 해제되었습니다. 로그인이 완료되었습니다.");
			} else if (res.equals("stop")) {
				model.addAttribute("url", "/main/login");
				model.addAttribute("msg", ho.getChangeDate() + " 기간 정지 회원입니다.");
			}
		} else if (ho.getHo_ms_state().equals("가입대기")) {
			model.addAttribute("url", "/main/login");
			model.addAttribute("msg", "승인 확인 전입니다.");
		} else if (ho.getHo_ms_state().equals("이용중") && user != null) {
			user.setAutoLogin(hospital.isAutoLogin());
			model.addAttribute("user", user);// user라는 이름으로 전송
			model.addAttribute("url", "/");
			model.addAttribute("msg", "로그인이 완료되었습니다.");
		} else {
			hospitalService.setLoginFail(ho.getHo_id());
			model.addAttribute("url", "/main/login");
			if (ho.getHo_fail() == 4) {
				model.addAttribute("msg", "로그인에 실패했습니다. 5/5 회 시도하였습니다. 비밀번호 찾기를 통해 로그인해주세요.");
			} else {
				model.addAttribute("msg", "로그인에 실패했습니다. " + (ho.getHo_fail() + 1) + "/5 회 시도하였습니다.");
			}
		}

		return "message";
	}

	// 로그아웃 기능
	@GetMapping("/logout")
	public String logout(Model model, HttpSession session) {
		//DB에서 cookie 정보를 삭제
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		user.setSite_cookie(null);
		user.setSite_cookie_limit(null);
		memberService.updateMemberCookie(user);
		
		session.removeAttribute("user");
		model.addAttribute("msg", "로그아웃 했습니다.");
		model.addAttribute("url", "/");
		return "message";
	}

	// 아이디 중복확인 ajax
	@ResponseBody
	@GetMapping("/checkId")
	public HashMap<String, Object> checkId(SiteManagement site) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement check = memberService.getMemberId(site);
		map.put("check", check);
		return map;
	}

	// 이메일 중복확인 ajax
	@ResponseBody
	@GetMapping("/checkEmail")
	public HashMap<String, Object> checkEmail(SiteManagement site) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement check = memberService.getMemberEmail(site);
		map.put("checkEmail", check);
		return map;
	}

	// 폰번호 중복확인 ajax
	@ResponseBody
	@GetMapping("/checkPhone")
	public HashMap<String, Object> checkPhone(SiteManagement site) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement checkPhone = memberService.getMemberPhone(site);
		map.put("checkNum", checkPhone);
		return map;
	}

	// 사업자 회원가입 : 아이디 중복확인 ajax
	@ResponseBody
	@GetMapping("/hospital/checkId")
	public HashMap<String, Object> ajaxHospitalId(@RequestParam("site_id") String site_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement check = hospitalService.ajaxHospitalId(site_id);
		map.put("hoIdCheck", check);
		return map;
	}

	// 사업자 회원가입 : 이메일 중복확인 ajax
	@ResponseBody
	@GetMapping("/hospital/checkEmail")
	public HashMap<String, Object> ajaxCheckEmail(@RequestParam("site_email") String site_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement check = hospitalService.ajaxHospitalEmail(site_email);
		map.put("hoEmailCheck", check);
		return map;
	}

	// 사업자 회원가입 : 폰번호 중복확인 ajax
	@ResponseBody
	@GetMapping("/hospital/checkPhone")
	public HashMap<String, Object> ajaxCheckPhone(@RequestParam("site_phone") String site_phone) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement check = hospitalService.ajaxHospitalPhone(site_phone);
		map.put("hoPhoneCheck", check);
		return map;
	}
}
