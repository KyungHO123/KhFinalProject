package kr.kh.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.BookmarkVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.ItemListVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReviewVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import kr.kh.team3.pagination.PageMaker;
import kr.kh.team3.service.HospitalService;
import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.ProgramService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HospitalController {

	@Autowired
	MemberService memberService;

	@Autowired
	private HospitalService hospitalService;

	@Autowired
	ProgramService programService;

	// 병원 마이페이지
	@GetMapping("/hospital/mypage")
	public String myPage(Model model, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null || !user.getSite_authority().equals("MANAGER")) {
			model.addAttribute("msg", "일반 회원은 접근할 수 없습니다");
			model.addAttribute("url", "/");
			return "message";
		}
		HospitalVO hospital = hospitalService.getHospitalMypage(user);
		ArrayList<HospitalSubjectVO> hsList = hospitalService.selectSubject();
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();

		model.addAttribute("hospital", hospital);
		model.addAttribute("hsList", hsList);
		model.addAttribute("sidoList", sidoList);
		return "/hospital/mypage";
	}

	@ResponseBody
	@PostMapping("/hospital/list")
	public HashMap<String, Object> myPagePost(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospitalMypage(user);
		HospitalSubjectVO hs = hospitalService.getSubject(hospital);
		LandVO land = hospitalService.getMyLand(hospital);
		String sd_name = hospitalService.getSdName(land);
		String sgg_name = hospitalService.getSggName(land);
		String emd_name = hospitalService.getEmdName(land);
		ArrayList<HospitalSubjectVO> hsList = hospitalService.selectSubject();
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();
		map.put("hospital", hospital);
		map.put("hsList", hsList);
		map.put("sidoList", sidoList);
		map.put("hs", hs);
		map.put("land", land);
		map.put("sd_name", sd_name);
		map.put("sgg_name", sgg_name);
		map.put("emd_name", emd_name);
		return map;
	}

	// 상호명 수정
	@ResponseBody
	@PostMapping("/hospital/name")
	public HashMap<String, Object> nameUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updateName(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);

		map.put("res", res);
		map.put("ho", ho);
		return map;
	}

	// 비번 수정
	@ResponseBody
	@PostMapping("/hospital/pw")
	public HashMap<String, Object> pwUpdate(@RequestParam("ho_id") String ho_id, HttpSession session,
			@RequestParam("oldPw") String oldPw, @RequestParam("newPw") String newPw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO ho = hospitalService.getHoId(ho_id);
		boolean res = hospitalService.updatePw(user, ho_id, oldPw, newPw);
		map.put("ho", ho);
		map.put("res", res);
		return map;
	}

	// 대표자명 수정
	@ResponseBody
	@PostMapping("/hospital/ceo")
	public HashMap<String, Object> ceoUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updateCEO(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);

		map.put("res", res);
		map.put("ho", ho);
		return map;
	}

	// 대표 전화번호 수정
	@ResponseBody
	@PostMapping("/hospital/phone")
	public HashMap<String, Object> phoneUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updatePhone(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);

		map.put("res", res);
		map.put("ho", ho);
		return map;
	}

	// 이메일 수정
	@ResponseBody
	@PostMapping("/hospital/email")
	public HashMap<String, Object> emailUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updateEmail(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);

		map.put("res", res);
		map.put("ho", ho);
		return map;
	}

	// 상세주소 수정
	@ResponseBody
	@PostMapping("/hospital/detail/address")
	public HashMap<String, Object> detailAddressUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updateDetailAddress(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);
		map.put("res", res);
		map.put("ho", ho);
		return map;
	}

	// 대표 진료과목 수정
	@ResponseBody
	@PostMapping("/hospital/subject")
	public HashMap<String, Object> subjectUpdate(@RequestParam("ho_id") String ho_id, HttpSession session,
			@RequestParam("ho_hs_num") int hs_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO ho = hospitalService.getHoId(ho_id);
		boolean res = hospitalService.updateSubject(user, ho, hs_num);
		HospitalVO hoSub = hospitalService.getHoId(ho_id);
		HospitalSubjectVO sub = hospitalService.getSubject(hoSub);

		map.put("ho", ho);
		map.put("sub", sub);
		map.put("res", res);
		return map;
	}

	// 주소 수정
	@ResponseBody
	@PostMapping("/hospital/address")
	public HashMap<String, Object> addressUpdate(@RequestParam("ho_id") String ho_id, HttpSession session,
			@RequestParam("la_sd_num") int la_sd_num, @RequestParam("la_sgg_num") int la_sgg_num,
			@RequestParam("la_emd_num") int la_emd_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		LandVO land = new LandVO(0, la_sd_num, la_sgg_num, la_emd_num);
		HospitalVO ho = hospitalService.getHoId(ho_id);
		LandVO la = hospitalService.getWholeLand(land);
		boolean res = hospitalService.updateAddress(user, ho, la);
		user.setSite_la_num(la.getLa_num());
		session.setAttribute("user", user);
		String sd_name = hospitalService.getSdName(la);
		String sgg_name = hospitalService.getSggName(la);
		String emd_name = hospitalService.getEmdName(la);

		map.put("sd_name", sd_name);
		map.put("sgg_name", sgg_name);
		map.put("emd_name", emd_name);
		map.put("ho", ho);
		map.put("res", res);
		return map;
	}

	@ResponseBody
	@PostMapping("/hospital/gungoo")
	public ArrayList<SiGoonGuVO> postgoongoo(int sd_num) {
		ArrayList<SiGoonGuVO> sggList = hospitalService.getSgg(sd_num);
		return sggList;
	}

	// 시군구 번호를 읍면동한테 넘겨줘서 시군구에 있는 읍면동들을 가져오는 메서드
	@ResponseBody
	@PostMapping("/hospital/eupmyeondong")
	public ArrayList<EupMyeonDongVO> postEupMyeonDong(int sgg_num) {
		ArrayList<EupMyeonDongVO> emdList = hospitalService.getEmd(sgg_num);
		return emdList;
	}

	// 회원탈퇴
	@GetMapping("/hospital/delete")
	public String userDelete(Model model, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		boolean res = hospitalService.deleteMyInfo(hospital, user);
		if (res) {
			session.invalidate();
			model.addAttribute("url", "/");
			model.addAttribute("msg", "회원탈퇴 했습니다.");
		} else {
			model.addAttribute("url", "/hospital/mypage");
			model.addAttribute("msg", "회원탈퇴 실패했습니다.");
		}

		return "message";
	}

	@GetMapping("/hospital/detail/detail")
	public String hospitalDetail(Model model, HttpSession session, String ho_id, BookmarkVO bookmark) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getSiteMember(user);
		HospitalDetailVO detail = hospitalService.getDetail(ho_id);
		if (detail == null||user == null) {
			model.addAttribute("msg", "상세페이지 등록 후 이용 가능한 서비스입니다.");
			model.addAttribute("url", "/hospital/mypage");
			return "message";
		}
		
		HospitalVO hospital = hospitalService.getHoId(detail.getHd_ho_id());
		
		LandVO land = hospitalService.getHoLand(hospital.getHo_la_num());
		SiDoVO sido = hospitalService.getHdSiDoName(land.getLa_sd_num());
		SiGoonGuVO sgg = hospitalService.getHdSggName(land.getLa_sgg_num());
		EupMyeonDongVO emd = hospitalService.getHdEmdName(land.getLa_emd_num());
		
		ArrayList<HospitalSubjectVO> sub = hospitalService.getDetailSubject(detail.getHd_ho_id());
		boolean detailAlready = memberService.selectDetailBookmark(bookmark, member, detail.getHd_ho_id());
		boolean booked = memberService.getReservationId(detail.getHd_ho_id(), member);
		
		model.addAttribute("booked", booked);
		model.addAttribute("detail", detail);
		model.addAttribute("sub", sub);
		model.addAttribute("detailAlready", detailAlready);
		model.addAttribute("land", land);
		model.addAttribute("sido", sido);
		model.addAttribute("sgg", sgg);
		model.addAttribute("emd", emd);
		model.addAttribute("user", user);
		
		return "/hospital/detail/detail";
	}

	// 리뷰 리스트
	@ResponseBody
	@PostMapping("/hospital/review/list")
	public Map<String, Object> reviewList(@RequestBody Criteria cri, String ho_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ReviewVO> reviewList = hospitalService.getCriReviewList(cri);
		int reviewTotalCount = hospitalService.getTotalReviewCount(cri);
		PageMaker pm = new PageMaker(10, cri, reviewTotalCount);
		map.put("reviewList", reviewList);
		map.put("pm", pm);
		return map;
	}

	// 리뷰 등록
	@ResponseBody
	@PostMapping("/hospital/review/insert")
	public Map<String, Object> reviewInsert(@RequestBody ReviewVO review, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getSiteMember(user);
		HospitalDetailVO ho = hospitalService.getHospitalDetail(review.getVw_hd_num());
		String res = hospitalService.insertReview(review, member, ho);
		map.put("result", res);
		return map;
	}

	// 리뷰 삭제
	@ResponseBody
	@PostMapping("/hospital/review/delete")
	public Map<String, Object> reviewDelete(@RequestBody ReviewVO review, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getSiteMember(user);
		boolean res = hospitalService.deleteReview(review, member);
		map.put("result", res);
		return map;
	}

	// 리뷰 수정
	@ResponseBody
	@PostMapping("/hospital/review/update")
	public Map<String, Object> reviewUpdate(@RequestBody ReviewVO review, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getSiteMember(user);

		boolean res = hospitalService.updateReview(review, member);
		map.put("result", res);
		return map;
	}

	// 병원 상세 페이지 등록/수정
	@GetMapping("/hospital/detail/insert")
	public String detailInsert(Model model, HospitalDetailVO detail, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if(user == null ||!user.getSite_authority().equals("MANAGER")) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}
		HospitalVO hospital = hospitalService.getHospital(user);
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		HospitalVO firstSubject = hospitalService.getHsNum(hospital);
		ArrayList<HsListVO> subjects = hospitalService.getSubjects(hospital);
		HospitalDetailVO hoDetail = hospitalService.getHoDetail(detail, hospital);

		model.addAttribute("hospital", hospital);
		model.addAttribute("hsList", hsList);
		model.addAttribute("firstSubject", firstSubject);
		model.addAttribute("subjects", subjects);
		model.addAttribute("hoDetail", hoDetail);
		return "/hospital/detail/insert";
	}

	// 병원 상세 페이지 등록/수정
	@ResponseBody
	@PostMapping("/hospital/detail/insert")
	public Map<String, Object> detailInsertPost(HttpSession session, @RequestBody HospitalDetailVO detail) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		// 병원 페이지 등록
		boolean res = hospitalService.insertDetail(detail, hospital);
		if (res) {
			map.put("msg", "상세 페이지 수정 완료");
			map.put("url", "/hospital/detail/detail");
		} else {
			map.put("msg", "상세 페이지 등록 완료");
			map.put("url", "/hospital/detail/detail");
		}
		return map;
	}

	@ResponseBody
	@PostMapping("/bookmark/insert")
	public Map<String, Object> bookmarkInsert(@RequestBody BookmarkVO bookmark, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getMemberInfo(user);
		boolean result = memberService.insertBookmark(bookmark, member);
		boolean already = memberService.selectBookmark(bookmark, member);

		map.put("user", user);
		map.put("result", result);
		map.put("already", already);
		return map;
	}

	@ResponseBody
	@PostMapping("/bookmark/delete")
	public Map<String, Object> bookmarkDelete(@RequestBody BookmarkVO bookmark, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getMemberInfo(user);
		boolean result = memberService.deleteBookmark(bookmark, member);

		map.put("user", user);
		map.put("result", result);
		return map;
	}

	// 병원 프로그램 등록 페이지 이동
	@GetMapping("/hospital/item/insert")
	public String hospitalProgramInsertPage(Model model, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if(user == null ||!user.getSite_authority().equals("MANAGER")) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}
		ArrayList<HospitalProgramVO> programList = programService.getProgramList(user);
		ArrayList<HsListVO> subjectList = programService.getSubjectList(user);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		for (HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), user);
				System.out.println(subject);
				list.add(subject);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("programList", programList);
		model.addAttribute("list", list);
		return "/hospital/detail/iteminsert";
	}

	@ResponseBody
	@PostMapping("/item/insert")
	public Map<String, Object> insertItem(ItemVO item, HttpSession session, @RequestParam("hs_num") int hs_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<ItemVO> itemList = programService.getAllItemList(user);
		HsListVO hslist = programService.getHsList(hs_num, user);
		boolean res = programService.insertItem(item, user, hslist);
		if (res) {
			map.put("itemList", itemList);
		} else {
			map.put("msg", "중복된 값이 있습니다.");
		}
		return map;
	}

	@GetMapping("/item/update")
	public String updateItem(ItemVO item, HttpSession session, Model model) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if(user == null ||!user.getSite_authority().equals("MANAGER")) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}
		ArrayList<HsListVO> subjectList = programService.getSubjectList(user);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		for (HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), user);
				System.out.println(subject);
				list.add(subject);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		model.addAttribute("list", list);
		return "/hospital/detail/itemupdate";
	}

	@ResponseBody
	@PostMapping("/subject/item")
	public Map<String, Object> SubjectItem(@RequestParam("hs_num") int hs_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HsListVO hslist = programService.getHsList(hs_num, user);
		ArrayList<ItemVO> itemList = programService.getItemList(user, hslist);
		ArrayList<HospitalProgramVO> hpList = programService.getSubjectByProgram(user, hslist);
		map.put("itemList", itemList);
		map.put("hpList", hpList);
		return map;
	}

	@PostMapping("/item/update")
	public String updateItemPost(ItemVO item, HttpSession session, Model model, @RequestParam("type") int it_num,
			@RequestParam("hs_num") int hs_num) {

		SiteManagement user = (SiteManagement) session.getAttribute("user");

		boolean res = programService.updateItem(item, user, it_num, hs_num);
		if (res) {
			model.addAttribute("msg", "상세 항목 수정을 완료했습니다.");
			model.addAttribute("url", "/hospital/item/insert");
		} else {
			model.addAttribute("msg", "상세 항목 수정에 실패 했습니다.");
			model.addAttribute("url", "/item/update");
		}
		return "message";
	}

	// 세부 항목 삭제 메서드
	@ResponseBody
	@PostMapping("/item/delete")
	public Map<String, Object> deleteItem(@RequestParam("checkedValues[]") ArrayList<Integer> list) {

		Map<String, Object> map = new HashMap<String, Object>();		
        boolean res = programService.deleteItem(list);
		
		if (res) { 
		 map.put("msg", "삭제에 성공했습니다."); 
		} else { 
			map.put("msg","삭제에 실패했습니다."); 
		} 
		 return map;
    }
	
	// 프로그램 수정에서 프로그램을 선택하면 자동으로 체크되어 있게 하는 메서드
	@ResponseBody
	@PostMapping("/program/item/check")
	public Map<String, Object> ProgramItemCheck(@RequestParam("hp_num") int hp_num,
			@RequestParam("hs_num") int hs_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();		
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		
		HsListVO hslist = programService.getHsList(hs_num, user);
		ArrayList<ItemVO> itemList = programService.getItemList(user, hslist);
		
		
		ArrayList<HsListVO> subjectList = programService.getSubjectList(user);
		ArrayList<HospitalSubjectVO> Alllist = new ArrayList<HospitalSubjectVO>();
		for (HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), user);
				System.out.println(subject);
				Alllist.add(subject);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		ArrayList<ItemListVO> list = programService.getProgramItemList(user, hp_num);
		map.put("itemList", itemList);
		map.put("list", list);
		return map;
    }

	// 프로그램을 추가하는 메서드
	@ResponseBody
	@PostMapping("/program/insert")
	public Map<String, Object> insertProgram(HospitalProgramVO program, HttpSession session,
			@RequestParam("list[]") ArrayList<Integer> list, @RequestParam("hs_num") int hs_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HsListVO hslist = programService.getHsList(hs_num, user);
		boolean res = programService.insertProgram(program, user, list, hslist.getHsl_hs_num());
		if (res) {
			map.put("msg", "추가에 성공했습니다.");
		} else {
			map.put("msg", "추가에 실패했습니다.");
		}
		return map;
	}

	// 프로그램 수정 메서드
	@GetMapping("/program/update")
	public String updateUpdate(HospitalProgramVO program, HttpSession session, Model model) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if(user == null ||!user.getSite_authority().equals("MANAGER")) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}
		ArrayList<HsListVO> subjectList = programService.getSubjectList(user);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		for (HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), user);
				System.out.println(subject);
				list.add(subject);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("list", list);
		ArrayList<HospitalProgramVO> programList = programService.getProgramList(user);
		ArrayList<ItemVO> itemList = programService.getAllItemList(user);
		model.addAttribute("programList", programList);
		model.addAttribute("itemList", itemList);
		return "/hospital/detail/programupdate";
	}

	// 프로그램 수정 메서드
	@ResponseBody
	@PostMapping("/program/updatecheck")
	public Map<String, Object> updateProgramCheck(@RequestParam("hs_num") int hs_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HsListVO hslist = programService.getHsList(hs_num, user);
		ArrayList<HospitalProgramVO> hpList = programService.getHpList(hslist.getHsl_num(), user);
		ArrayList<ItemVO> itemList = programService.getItemList(user, hslist);
		map.put("hpList", hpList);
		map.put("itemList", itemList);
		return map;
	}

	// 프로그램 수정 메서드
	@ResponseBody
	@PostMapping("/program/update")
	public boolean updateProgramInsert(Model model, @RequestParam("hs_num") int hs_num, HttpSession session,
			HospitalProgramVO hospitalProgram, @RequestParam("list[]") ArrayList<Integer> list) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = programService.deleteProgram(hospitalProgram.getHp_num());
		boolean insertres = programService.insertProgram(hospitalProgram, user, list, hs_num);
		
		if(res) {
			if(insertres) {
				return true;
      }
		}
		return false;
    }
	
	@GetMapping("/program/delete")
	public String deleteprogram(Model model, int hp_num) {
		boolean res = programService.deleteProgram(hp_num);

		if (res) {
			model.addAttribute("msg", "프로그램 삭제를 완료했습니다.");
			model.addAttribute("url", "/hospital/item/insert");
		} else {
			model.addAttribute("msg", "프로그램 삭제를 실패 했습니다.");
			model.addAttribute("url", "/program/update");
		}
		return "message";
	}

	// 프로그램에 속한 리스트를 조회하는 메서드
	@ResponseBody
	@PostMapping("/itemlist/check")
	public Map<String, Object> selectItemList(@RequestParam("hp_num") int hp_num, HttpSession session,
			@RequestParam("hs_num") int hs_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HsListVO hslist = programService.getHsList(hs_num, user);
		HospitalProgramVO hp = programService.getHospitalProgram(hslist, hp_num, user);
		ArrayList<ItemListVO> itemListList = programService.getProgramItemList(user, hp_num);
		map.put("itemList", itemListList);
		map.put("hp", hp);
		return map;
	}

	// 프로그램 리스트 속한 아이템을 조회하는 메서드
	@ResponseBody
	@PostMapping("/item/check")
	public Map<String, Object> selectItem(@RequestParam("il_num") int il_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<ItemVO> itemList = programService.getItemListByItem(il_num);
		map.put("itemList", itemList);
		return map;
	}

	@ResponseBody
	@PostMapping("/date/insert")
	public Map<String, Object> InsertDate(HttpSession session, @RequestParam("rs_hp_num") String rs_hp_num,
			@RequestParam("rs_date") String rs_date, @RequestParam("rs_time") String rs_time,
			@RequestParam("rs_max_person") int rs_max_person) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = programService.insertReservationSechedule(rs_hp_num, rs_date, rs_time, rs_max_person);
		if (res) {
			map.put("msg", "추가되었습니다.");
		} else {
			map.put("msg", "추가를 실패했습니다.");
		}
		return map;
	}

	// 스케줄 수정 메서드
	@GetMapping("/date/update")
	public String ScheduleUpdate(HospitalProgramVO program, HttpSession session, Model model) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<HsListVO> subjectList = programService.getSubjectList(user);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		for (HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), user);
				System.out.println(subject);
				list.add(subject);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("list", list);
		ArrayList<HospitalProgramVO> programList = programService.getProgramList(user);
		model.addAttribute("programList", programList);
		return "/hospital/detail/dateupdate";
	}

	// 스케줄 수정 메서드
	@ResponseBody
	@PostMapping("/date/update")
	public Map<String, Object> updateProgramScheduleCheck(@RequestParam("hp_num") int hp_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 해당 과와아이디를 이용해 번호를 가져오는 메서드
		ArrayList<ReservationScheduleVO> RSlist = programService.getRsList(hp_num);
		map.put("RSlist", RSlist);
		return map;
	}

	@ResponseBody
	@PostMapping("/date/realupdate")
	public Map<String, Object> realUpdateProgramScheduleCheck(@RequestParam("rs_date") String rs_date,
			@RequestParam("rs_time") String rs_time, @RequestParam("rs_max_person") int rs_max_person,
			@RequestParam("rs_num") int rs_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = programService.updateDate(rs_num, rs_date, rs_time, rs_max_person);
		if (res) {
			map.put("res", true);
		} else {
			map.put("res", false);
		}
		return map;
	}

	// 스케줄 수정 메서드
	@GetMapping("/date/delete")
	public String ScheduleDelete(HospitalProgramVO program, HttpSession session, Model model) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if(user == null ||!user.getSite_authority().equals("MANAGER")) {
			model.addAttribute("msg","접근할 수 없는 페이지입니다.");
			model.addAttribute("url","/");
			return "message";
		}
		ArrayList<HsListVO> subjectList = programService.getSubjectList(user);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		for (HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), user);
				System.out.println(subject);
				list.add(subject);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("list", list);
		ArrayList<HospitalProgramVO> programList = programService.getProgramList(user);
		model.addAttribute("programList", programList);
		return "/hospital/detail/datedelete";
	}

	@ResponseBody
	@PostMapping("/date/delete")
	public Map<String, Object> deleteProgramScheduleCheck(@RequestParam("rs_num") int rs_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = programService.DeleteDate(rs_num);
		if (res) {
			map.put("res", true);
		} else {
			map.put("res", false);
		}
		return map;
	}

	/* 병원 리스트 출력 정경호,권기은 */
	@GetMapping("/hospital/list")
	public String hospitalList(HttpSession session, Model model, int hs_num) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}

		ArrayList<HospitalSubjectVO> list = hospitalService.selectSubjectAll();
		model.addAttribute("list", list);
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();
		LandVO la = memberService.getMyLand(user);
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("la", la);
		model.addAttribute("hs_num", hs_num);

		return "/hospital/list";
	}

	@ResponseBody
	@PostMapping("/hospital/emd/list")
	public Map<String, Object> postHospital(@RequestParam("emd_num") int emd_num, int hs_num, String search,
			@RequestParam("page") int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page, 12, null, search);
		LandVO land = hospitalService.getLand(emd_num);
		ArrayList<HospitalVO> hoList;
		int totalCount;
		if (hs_num == 0) {
			hoList = hospitalService.getHospitalSubAll(land, cri);
			log.info("al;sdfjlskadmkmj15321 " + hoList);
			totalCount = hospitalService.getHospitalSubAllCount(land, cri);
		} else {
			hoList = hospitalService.getHospitalEmd(land, hs_num, cri);
			log.info("ㅗㅜㅘㅓㅏㅏal;sdfjlskadmkmj15321 " + hoList);
			totalCount = hospitalService.getHospitalCountEmd(land, hs_num, cri);
		}
		PageMaker pm = new PageMaker(5, cri, totalCount);

		map.put("pm", pm);
		map.put("hoList", hoList);
		return map;

	}

	@ResponseBody
	@PostMapping("/hospital/like/list")
	public Map<String, Object> postLiHospital(@RequestParam("emd_num") int emd_num, HttpSession session,
			@RequestParam("page") int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page);
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO me = memberService.getMeId(user.getSite_id());
		LandVO land = hospitalService.getLand(emd_num);
		cri.setPerPageNum(8);
		int totalCount = hospitalService.getLikeSub(me, land, cri);
		ArrayList<HospitalVO> hoSubList = hospitalService.getSubHoList(me, land, cri);
		log.info("al;sdfjlskadmkmj15321 " + hoSubList);
		PageMaker pm = new PageMaker(10, cri, totalCount);
		map.put("pm", pm);
		map.put("hoSubList", hoSubList);
		return map;

	}

	@ResponseBody
	@PostMapping("/hospital/area/name")
	public Map<String, Object> areaName(@RequestParam("sd_num") int sd_num, @RequestParam("sgg_num") int sgg_num,
			@RequestParam("emd_num") int emd_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		LandVO land = new LandVO(0, sd_num, sgg_num, emd_num);
		String sd_name = memberService.getSdName(land);
		String sgg_name = memberService.getSggName(land);
		String emd_name = memberService.getEmdName(land);
		map.put("sd_name", sd_name);
		map.put("sgg_name", sgg_name);
		map.put("emd_name", emd_name);
		return map;

	}

}
