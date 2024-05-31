package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.PaymentVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReservationVO;

public interface ReservationScheduleDAO {

	ReservationScheduleVO selectRSTime(@Param("rs_num")int rs_num);

	ArrayList<ReservationScheduleVO> selectRSTimeList(@Param("date") String date, 
			@Param ("hp_num") int hp_num);

	ArrayList<ReservationVO> selectReservationList(@Param("rs_num")int rs_num);

	HospitalProgramVO selectHospitalProgram(@Param("hp_num")int hp_num);

	boolean updateUserChedule(@Param("rs_num")int rs_num, @Param("rv_num")int rv_num);

	int reservationCount(@Param("rs_num")int rs_num);

	ReservationScheduleVO programByMaxPerson(@Param("time") String time, @Param("date") String date);

	ReservationVO selectReservationUpadateList(@Param("rs_num")int rs_num);

	ArrayList<ReservationVO> selectReservationList();

	ArrayList<ReservationVO> selectReservationList2();

	ArrayList<ReservationVO> selectReservationList22(@Param("rs_num")int rs_num);

	ReservationVO selectReservation(@Param("rv_num") int rv_num);

	boolean updateUserScheduleState(@Param("rv_num") int rv_num);

	PaymentVO selectPayment(@Param("rv_num")int rv_num);

	boolean updatePaymentStateChange(@Param("pm_num")String pm_num);

	PaymentVO selectRvNumByPaymentsTable(@Param("rv_num")int rv_num);

}
