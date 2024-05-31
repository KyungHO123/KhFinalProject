package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.ItemListVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.PaymentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReservationVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface ProgramService {
	
	ArrayList<ItemVO> getAllItemList(SiteManagement user);

	boolean insertItem(ItemVO item, SiteManagement user, HsListVO hslist);

	ArrayList<HospitalProgramVO> getProgramList(SiteManagement user);

	boolean insertProgram(HospitalProgramVO program, SiteManagement user, ArrayList<Integer> list, int hs_num);

	boolean updateItem(ItemVO item, SiteManagement user, int it_num, int hs_num);

	boolean deleteItem(ArrayList<Integer> intList);

	boolean deleteProgram(int hp_num);

	ArrayList<ItemListVO> getItemListList(SiteManagement user, int hp_num);

	ArrayList<ItemVO> getItemListByItem(int il_num);

	ArrayList<ItemListVO> getProgramItemList(SiteManagement user, int hp_num);

	ArrayList<HsListVO> getSubjectList(SiteManagement user);

	HospitalSubjectVO getSubject(int hs_num, SiteManagement user);

	HsListVO getHsList(int hs_num, SiteManagement user);

	ArrayList<ItemVO> getItemList(SiteManagement user, HsListVO hslist);

	ArrayList<HospitalProgramVO> getHpList(int hs_num, SiteManagement user);

	ArrayList<HospitalProgramVO> getSubjectByProgram(SiteManagement user, HsListVO hslist);

	HospitalProgramVO getHospitalProgram(HsListVO hslist, int hp_num, SiteManagement user);

	boolean insertReservationSechedule(String rs_hp_num, String rs_date, String rs_time, int rs_max_person);

	ArrayList<ReservationScheduleVO> getRsList(int hp_num);

	boolean updateDate(int rs_num, String rs_date, String rs_time, int rs_max_person);

	boolean DeleteDate(int rs_num);

	boolean insertReservation(ReservationVO rv);

	ReservationVO selectReservation(ReservationVO rv);

	boolean insertPay(PaymentVO payment);

	boolean selectUserReserve(String site_id, int rv_rs_num);

	ArrayList<PostVO> getBookList(SiteManagement user, Criteria cri);

	int getBookListCount(SiteManagement user, Criteria cri);

	boolean updateRvRvsName(int rv_num);

}