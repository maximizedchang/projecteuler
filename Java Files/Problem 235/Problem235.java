package euler;

import java.math.BigDecimal;
import java.math.RoundingMode;

/*
 * Solution: 1.002322108633
 * Time: 18.600 seconds
 */

public class Problem235 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long startTime = System.currentTimeMillis();
		String leadingDecimalZeroes = "";
		String originalString = "1.";
		int desiredDigits = 12;
		BigDecimal target = new BigDecimal("-600000000000");
		while(true){
			if(target.compareTo(calculateFunction(new BigDecimal(originalString + leadingDecimalZeroes + "1"))) < 0){
				break;
			}
			leadingDecimalZeroes += "0";
		}
		originalString += leadingDecimalZeroes;
		int remainingDigits = desiredDigits - (originalString.length() - 2) + 1;
		for(int i = 0; i < remainingDigits; i++){
			for(char digit = '1'; digit <= '9'; digit++){
				String newString = originalString + digit;
				BigDecimal result = calculateFunction(new BigDecimal(newString));
				if(target.compareTo(result) > 0){
					originalString += ((char) (digit - 1));
					break;
				}
			}
		}
		System.out.println((new BigDecimal(originalString).setScale(12, RoundingMode.HALF_UP)).toString());
		System.out.println(System.currentTimeMillis() - startTime);
	}
	
	public static BigDecimal calculateFunction(BigDecimal r){
		BigDecimal firstNumerator = (new BigDecimal(900)).add((new BigDecimal(14100)).multiply(r.pow(5000)));
		BigDecimal firstDenominator = (BigDecimal.ONE.subtract(r));
		BigDecimal secondNumerator = ((new BigDecimal(3)).multiply(r.pow(5000))).subtract(new BigDecimal(3));
		BigDecimal secondDenominator = (BigDecimal.ONE.subtract(r)).pow(2);
		BigDecimal firstNumber = firstNumerator.divide(firstDenominator, 20, RoundingMode.HALF_UP);
		BigDecimal secondNumber = secondNumerator.divide(secondDenominator, 20, RoundingMode.HALF_UP);
		return (firstNumber.add(secondNumber));
 	}
}
