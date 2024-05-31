package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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

public interface ProgramDAO {

	ArrayList<ItemVO> selectItemList(@Param("user") SiteManagement user);

	boolean insertItem(@Param("item")ItemVO item,@Param("user") SiteManagement user, @Param("hslist")HsListVO hslist);

	ArrayList<HospitalProgramVO> selectProgramList(@Param("user") SiteManagement user);

	boolean insertProgram(@Param("pr")HospitalProgramVO program,@Param("user") SiteManagement user, @Param("hs_num") int hs_num, @Param("hsl")HsListVO hslist);

	boolean updateItem(@Param("item")ItemVO item, @Param("it_num") int it_num,@Param("hsl_nul") HsListVO hl);

	boolean deleteItem(@Param("it_num")int tmp);

	boolean deleteProgram(@Param("hp_num")int hp_num);

	boolean insertItemList(@Param("pr")HospitalProgramVO program,@Param("il_it_num") int tmp);

	ArrayList<ItemListVO> selectItemListList(@Param("user")SiteManagement user,@Param("hp_num") int hp_num);

	ArrayList<ItemVO> selectItemListByItem(@Param("il_num")int il_num);

	HospitalProgramVO selectProgram(@Param("pr")HospitalProgramVO program, @Param("ho_id") String ho_id);

	boolean deleteItemList(@Param("hp_num") int hp_num);

	ArrayList<ItemListVO> selectProgramItem(@Param("hp_num") int hp_num);

	ArrayList<HsListVO> selectHospitalSubject(@Param("user")SiteManagement user);

	HospitalSubjectVO selectSubject(@Param("hs_num")int hs_num);

	HsListVO selelctHsList(@Param("hs_num") int hs_num, @Param("user")SiteManagement user);

	ArrayList<ItemVO> selectItemSubjectByList(@Param("user") SiteManagement user,@Param("hs_num") int hs_num);

	ArrayList<HospitalProgramVO> selectSubjectByProgramList(@Param("hsl_num")int hsl_num,@Param("user") SiteManagement user);

	HospitalProgramVO selectItemListByProgram(@Param("hsl_num")int hsl_num,@Param("hp_num") int hp_num, @Param("user")SiteManagement user);

	boolean insertReservationSechedule(@Param("rs_hp_num")String rs_hp_num, @Param("rs_date")String rs_date, @Param("rs_time")String rs_time, @Param("rs_max_person")int rs_max_person);

	ArrayList<ReservationScheduleVO> selectReservationScheduleList(@Param("hp_num")int hp_num);

	boolean updateSchedule(@Param("rs_num")int rs_num, @Param("rs_date")String rs_date, @Param("rs_time")String rs_time, @Param("rs_max_person")int rs_max_person);

	boolean deleteSchedule(@Param("rs_num")int rs_num);

	boolean insertResrvationBook(@Param("rv")ReservationVO rv);

	ReservationVO selectReservation(@Param("rv")ReservationVO rv);

	boolean insertPay(@Param("pay")PaymentVO payment);

	ArrayList<ReservationVO> selectUserReserve(@Param("site_id")String site_id, @Param("rv_rs_num")int rv_rs_num);

	ArrayList<PostVO> selectBookList(@Param("user")SiteManagement user, @Param("cri")Criteria cri);

	int selectBookListCount(@Param("user")SiteManagement user, @Param("cri")Criteria cri);

	boolean updateRvRvsName(@Param("rv_num")int rv_num);

}