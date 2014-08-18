package euler;

/*
 * Solution: 209566
 * Time: 0.436 seconds
 */

import java.util.ArrayList;

public class Problem174 {
	static ArrayList<Integer> primes = new ArrayList<Integer>();
	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
		int max = 1000000;
		int count = 0;
		for(int i = 1; i <= (max/4); i++){
			int type = LType(i);
			if(type <= 10 && type >= 1) count++;
		}
		System.out.println(count);
		System.out.println(System.currentTimeMillis() - startTime);
	}
	
	public static int LType(int n){
		int max = (int)Math.sqrt(n - 1);
		int count = 0;
		for(int factor = 1; factor <= max; factor++){
			if(n % factor == 0){
				count++;
			}
			if(count > 10){
				return count;
			}
		}
		return count;
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
