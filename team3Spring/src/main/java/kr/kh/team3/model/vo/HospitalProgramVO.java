package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HospitalProgramVO {
	private int hp_num;
	private String hp_title;
	private int hp_payment;
	private String hp_ho_id;
	private int hp_hsl_num;
	private HsListVO hsList;
	private HospitalVO hospital;
	
	public String getPayMentMoney() {
        String paymentStr = String.valueOf(hp_payment);
        StringBuilder formattedPayment = new StringBuilder();

        int count = 0;
        // 뒤에서부터 문자열을 탐색하며 쉼표를 추가
        for (int i = paymentStr.length() - 1; i >= 0; i--) {
            char digit = paymentStr.charAt(i);
            formattedPayment.insert(0, digit); // 숫자를 앞쪽에 추가

            // 세 자리마다 쉼표 추가
            count++;
            if (count == 3 && i != 0) {
                formattedPayment.insert(0, ',');
                count = 0;
            }
        }

        return formattedPayment.toString();
    }
}
