package kr.kh.team3.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.kh.team3.dao.ProgramDAO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.ItemListVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.PaymentVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReservationVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.HospitalService;
import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.ProgramService;
import kr.kh.team3.service.ReservationScheduleService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ReservationScheduleController {

	@Autowired
	ReservationScheduleService reservationScheduleService;

	@Autowired
	ProgramService programService;
	@Autowired
	HospitalService hospitalService;
	@Autowired
	MemberService memberService;
	@Autowired
	ProgramDAO programDao;

	// 스케줄 수정 메서드
	@GetMapping("/schedule")
	public String ScheduleUpdate(HttpSession session, Model model, String ho_id) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO me = memberService.getMemberInfo(user);
		SiteManagement ho = new SiteManagement();
		ho.setSite_id(ho_id);
		ArrayList<HsListVO> subjectList = programService.getSubjectList(ho);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		ArrayList<HospitalProgramVO> programList = programService.getProgramList(user);
		for (HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), ho);
				list.add(subject);
			} catch (Exception e) {

			}
		}
		HospitalVO hospital = hospitalService.getHoId(ho_id);
		model.addAttribute("hospital", hospital);
		model.addAttribute("list", list);
		model.addAttribute("programList", programList);
		model.addAttribute("ho", ho);
		model.addAttribute("me", me);
		model.addAttribute("user", user);
		return "/schedule/schedule";
	}

	// 과를 선택하면 여러 정보가 나옴
	@ResponseBody
	@PostMapping("/program/updatecheck2")
	public Map<String, Object> updateProgramCheck(@RequestParam("hs_num") int hs_num, @RequestParam("ho") String ho) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = new SiteManagement();
		user.setSite_id(ho);
		// 해당 과와아이디를 이용해 번호를 가져오는 메서드
		HsListVO hslist = programService.getHsList(hs_num, user);
		// 과를 선택할 때마다 프로그램을 가져오는 메서드
		ArrayList<HospitalProgramVO> hpList = programService.getHpList(hslist.getHsl_num(), user);
		ArrayList<ItemVO> itemList = programService.getItemList(user, hslist);
		map.put("hpList", hpList);
		map.put("itemList", itemList);
		return map;
	}

	// 프로그램을를 선택하면 여러 정보가 나옴
	@ResponseBody
	@PostMapping("/getdate")
	public Map<String, Object> updateProgramScheduleCheck(@RequestParam("hp_num") int hp_num, @RequestParam("ho") String ho) {
		Map<String, Object> map = new HashMap<String, Object>();
		HospitalProgramVO hp = hospitalService.getHospitalProgram(hp_num);
		SiteManagement user = new SiteManagement();
		user.setSite_id(ho); 
		// 해당 과와아이디를 이용해 번호를 가져오는 메서드
		ArrayList<ReservationScheduleVO> RSlist = programService.getRsList(hp_num);
		//프로그램을 선택하면 세부항목 명과 세부항목 설명을 띄우기 위한 리스트
		ArrayList<ItemListVO> itemList = programService.getProgramItemList(user, hp_num);

		map.put("itemList", itemList);
		map.put("hp", hp);
		map.put("RSlist", RSlist);
		return map;
	}

	// 프로그램을를 선택하면 여러 정보가 나옴
	@ResponseBody
	@PostMapping("/gettime")
	public Map<String, Object> getTime(@RequestParam("tmp") String tmp, HttpSession session,
			@RequestParam("hp_num") int hp_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 해당 과와아이디를 이용해 번호를 가져오는 메서드
		//ReservationScheduleVO time = reservationScheduleService.getRsTime(rs_num);
		ArrayList<ReservationScheduleVO> RSTimeList = reservationScheduleService.getRsList(tmp,
				hp_num);
		map.put("timeList", RSTimeList);
		map.put("time", tmp);
		return map;
    }
	
	@ResponseBody
	@GetMapping("/date/maxperson/check")
	public boolean maxPersonCheck(HttpSession session, Model model, int rs_num) {
		boolean res =  reservationScheduleService.MaxPersonCheck(rs_num);
		return res;
	}
	
//	예약된 회원을 관리하는 페이지 get
	@GetMapping("/hospital/schedule/change")
	public String ScheduleMemberCheck(HttpSession session, Model model) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<HsListVO> subjectList = programService.getSubjectList(user);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		for (HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), user);
				list.add(subject);
			} catch (Exception e) {

			}
		}

		model.addAttribute("list", list);
		ArrayList<HospitalProgramVO> programList = programService.getProgramList(user);
		model.addAttribute("programList", programList);
		model.addAttribute("ho", user);
		return "/schedule/schedulechange";
	}

	// 프로그램을를 선택하면 여러 정보가 나옴
	@ResponseBody
	@PostMapping("/schedule/check")
	public Map<String, Object> scheduleCheck(@RequestParam("hp_num") int hp_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ReservationScheduleVO> RSlist = programService.getRsList(hp_num);
		if(RSlist.size() == 0) {
			map.put("msg", "예약이 없습니다.");
			return map;
		}
		HospitalProgramVO HP = reservationScheduleService.getHospitalProgram(hp_num);
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		ArrayList<ReservationVO> list2 = new ArrayList<ReservationVO>();
		list = reservationScheduleService.getReservationList22(RSlist.get(0).getRs_num());
		
		for (ReservationScheduleVO tmp : RSlist) {
			ArrayList<ReservationVO> arr = reservationScheduleService.getReservationList22(tmp.getRs_num());
			for(ReservationVO tmp2 : arr) {
				list2.add(tmp2);
			}
		}
		
		ArrayList<PaymentVO> paymentList = new ArrayList<PaymentVO>();
		//예약번호를 넘겨줘서 결제 정보 가져오기
		for(ReservationVO tmp : list2) {
			//PaymentVO resertMap해보기
			PaymentVO arr = reservationScheduleService.getPaymentList(tmp.getRv_num());
			paymentList.add(arr);
		}
		
		map.put("list", list);
		map.put("HP", HP);
		map.put("list2", list2);	
		map.put("paymentList", paymentList);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/delete/schedule")
	public boolean deleteUserSchedule(Model model, int rv_num) throws Exception {
		
		//예약 완료 상태인 회원을 결제 취소를 하면 예약 취소가 되게 하는 메서드
		boolean res = reservationScheduleService.updateUserSchedule(rv_num);		
		return res;
	}
	
	@GetMapping("/update/userschedule")
	public String updateUserSchedule(Model model, int rv_num, String date, 
			String time2, int hp_num, HttpSession session) throws Exception{
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		date = date.replaceAll("/", "-");
		time2 = time2.replaceAll(" ", "");
		time2 = time2.replace("시", ":");		
		time2 = time2.replace("분", ":");		
		time2 = time2+"00";		
		System.out.println(time2);
		boolean res = reservationScheduleService.updateUserSchedule(rv_num, date, time2, hp_num);
		if(res) {
			model.addAttribute("msg", "예약 변경에 성공하였습니다.");
			if(user.getSite_authority().equals("MANAGER")) {
				model.addAttribute("url", "/hospital/schedule/change");
			}else {
				model.addAttribute("url", "/member/reservemgr?siteid=" + user.getSite_id());
			}
		}else {
			model.addAttribute("msg", "예약 변경에 실패하였습니다.");
			if(user.getSite_authority().equals("MANAGER")) {
				model.addAttribute("url", "/hospital/schedule/change");
			}else {
				model.addAttribute("url", "/member/reservemgr?siteid=" + user.getSite_id());
			}
		}
		return "message";
	}

	// rufwp
	@PostMapping("/bookingPay")
	@ResponseBody
	public Map<String, Object> bookPay(@RequestParam("amount") int amount, @RequestParam("imp_uid") String imp_uid,
			@RequestParam("merchant_uid") String merchant_uid, @RequestParam("rs_num") int rs_num,
			@RequestParam("ho_id") String ho_id, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ReservationVO rv = new ReservationVO("예약완료", rs_num, user.getSite_id());

		boolean reserve = programService.insertReservation(rv);
		ReservationVO reservation = programService.selectReservation(rv);
		if (reserve) {
			PaymentVO payment = new PaymentVO(merchant_uid, "card", "결제완료", amount, reservation.getRv_num(), ho_id);
			boolean insertPay = programService.insertPay(payment);
			if (insertPay) {
				map.put("success", true);
			} else {
				map.put("success", false);
			}
		} else {
			map.put("success", false);
		}
		return map;
	}

	private IamportClient iamportClient = new IamportClient("", "");

	@ResponseBody
	@PostMapping("/verify")
	public IamportResponse<Payment> paymentByImpUid(@RequestParam("imp_uid") String imp_uid)
			throws IamportResponseException, IOException {
		return iamportClient.paymentByImpUid(imp_uid);
	}

	@ResponseBody
	@PostMapping("/checkReserve")
	public Map<String, Object> checkReserve(HttpSession session, int rv_rs_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean reserve = programService.selectUserReserve(user.getSite_id(), rv_rs_num);
		map.put("res", reserve);
		return map;
	}
	
	
	@ResponseBody
	@PostMapping("/payments/cancel")
	private Map<String, Object> rePayments() throws IOException, InterruptedException {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.iamport.kr/users/getToken"))
			    .header("Content-Type", "application/json")
			    .method("POST", HttpRequest.BodyPublishers.ofString("{\"imp_key\":\"2782622183686774\",\"imp_secret\":\"ZrUBWx6yNEckgEgZrIwSw2MMeW61rEM0DUEiqPw7YnbOc4gkPE7bxxtw8HoEpCjAITgBThyjjHGsLT0Z\"}"))
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			System.out.println(response.body());
			
		return map;
	}
	
	@ResponseBody
	@PostMapping("/get/pmnum")
	private Map<String, Object> getPmNum(int rv_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		PaymentVO pm_num = reservationScheduleService.getPaymentNum(rv_num);
		map.put("payment", pm_num);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/payment/state/change")
	private boolean reservationStateChange(@RequestParam("pm_num")String pm_num) {
		System.out.println("aaaaaaaaaaaaaaaa");
		System.out.println(pm_num);
		boolean res = reservationScheduleService.updatePaymentStateChange(pm_num);
		return res;
	}

}
