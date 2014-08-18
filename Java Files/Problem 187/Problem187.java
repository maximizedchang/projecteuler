package euler;

import java.util.ArrayList;

/*
 * Solution: 17427258
 * Time: 3.811 seconds 
 */

public class Problem187 {
	
	static ArrayList<Integer> primes = new ArrayList<Integer>();
	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
		int max = 100000000-1;
		generatePrimes(max);
		int total = 0;
		for(int i = 0; i < primes.size(); i++){
			double maxDivisor = max / primes.get(i);
			for(int j = i; j < primes.size(); j++){
				if(primes.get(j) > maxDivisor){
					total += (j - i);
					break;
				}
			}
		}
		System.out.println(total);
		System.out.println(System.currentTimeMillis() - startTime);
	}
	public static void generatePrimes(int max){
		boolean[] isComposite = new boolean[max + 1];
		for(int i = 2; i <= max/2; i++){
			if(!isComposite[i]){
				primes.add(i);
				for(int multiplier = 2 ; multiplier <= max/i; multiplier++){
					isComposite[i * multiplier] = true;
				}
			}
		}
		for(int i = max/2 + 1; i < max; i++){
			if(!isComposite[i]){
				primes.add(i);
			}
		}
	}
}
