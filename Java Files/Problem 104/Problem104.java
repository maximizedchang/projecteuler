package euler;

/*
 * Answer: 329468
 * Time: 0.137 seconds
 */

public class Problem104 {

	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
		long num1Start = 1L;
		long num2Start = 1L;
		long num1End = 1L;
		long num2End = 1L;
		long counter = 2L;
		while(true){
			if(isPandigital(num2End, false) && isPandigital(num2Start, true)){
				System.out.println(num2Start);
				System.out.println(num2End);
				System.out.println(counter);
				break;
			} else {
				long tempEnd = num1End + num2End;
				num1End = num2End % 1000000000L;
				num2End = tempEnd % 1000000000L;
				long tempStart = num1Start + num2Start;
				num1Start = num2Start;
				num2Start = tempStart;
				counter++;
				if(num1Start > 1000000000000000L){
					num1Start = num1Start / 10L;
					num2Start = num2Start / 10L;
				}
			}
		}
		System.out.println(System.currentTimeMillis() - startTime);
	}
	
	
	public static boolean isPandigital(long n, boolean start){
		String number = "" + n;
		if(number.length() < 9) return false;
		boolean[] digits = new boolean[10];
		digits[0] = true;
		if(start){
			for(int i = 0; i < 9; i++){
				if(digits[number.charAt(i) - '0']){
					return false;
				} else {
					digits[number.charAt(i) - '0'] = true;
				}
			}
		} else {
			for(int i = 0; i < 9; i++){
				if(digits[number.charAt(number.length() - 1 - i) - '0']){
					return false;
				} else {
					digits[number.charAt(number.length() - 1 - i) - '0'] = true;
				}
			}
		}
		return true;
	}

}
