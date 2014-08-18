package euler;

import java.util.ArrayList;

/*
 * Solution: 986262
 * Time: 0.992 seconds
 */

public class Problem179 {
	static ArrayList<Integer> primes = new ArrayList<Integer>();
	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
		int max = 10000000;
		generatePrimes(max);
		int count = 0;
		int[] totients = new int[max + 1];
		int[] multipliers = new int[max + 1];
		for(int i = 0 ; i < max; i++){
			totients[i] = 1;
			multipliers[i] = 1;
		}
		for(int i = 0; i < primes.size(); i++){
			int prime = primes.get(i);
			for(int multiplier = 1; multiplier <= max/prime; multiplier++){
				if(multiplier % prime == 0){
					totients[prime * multiplier] *= (multipliers[multiplier] + 1);
					multipliers[prime * multiplier] = (multipliers[multiplier] + 1);
				} else {
					totients[prime * multiplier] *= 2;
					multipliers[prime * multiplier] = 2;
				}
			}
		}
		for(int i = 2; i < max; i++){
			if(totients[i] == totients[i + 1]) count++;
		}
		System.out.println(count);
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
