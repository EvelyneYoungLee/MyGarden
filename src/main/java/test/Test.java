package test;

import java.util.Calendar;

public class Test {
	public void calendar() {
		//Calendar ��ü ����(�߻�Ŭ���� �̱� ������ getInstance�� ��ü�� �����Ѵ�.)
		Calendar cal = Calendar.getInstance();

		// 1~12 ��
		for(int month=0; month<12; month++) {
			System.out.println(cal.get(Calendar.YEAR));
			// �� ����
			cal.set(Calendar.MONTH, month);
			System.out.println(cal.get(Calendar.MONTH)+1+"��");

			// ���� ���������� ���� maxDay�� ����
			int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			cal.set(Calendar.DATE,1);

			// 1�Ϻ��� ������ �� ����
			for(int i=1; i<=maxDay; i++) {
				cal.set(Calendar.DATE, i);

				//�� ������ �ϱ� ���� ������ ���° ������ ����
//				int wom1 = cal.get(Calendar.WEEK_OF_MONTH);

				//day ���
				System.out.print(cal.get(Calendar.DATE) + " ");
				//���ð� ������ ���° ������ ���ϱ� ���ؼ� �������� set
				cal.set(Calendar.DATE, i + 1);
//				int wom2 = cal.get(Calendar.WEEK_OF_MONTH);
			}
			System.out.println();
		}

	}

		public static void main(String[] args) {
			Test t = new Test();
			t.calendar();
		}

}
