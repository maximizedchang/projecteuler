package euler;

import java.util.ArrayList;

/*
 * Solution: 173
 * Time: 0.558 seconds
 * n^3 + n^2*p = (n + k)^3
 * Solving for n, you get n = (3k^2 + k*sqrt(4kp - 3k^2)) / (2(p - 3k))
 * In order for n to be an integer sqrt(4kp - 3k^2) = k*sqrt((4p - 3k)/k) must be an integer
 * We know that p - 3k must be positive so k < p/3 < p. Thus, k and p cannot share a common factor except 1. 
 * In order for the expression to be an integer, the numerator and denominator must both be perfect squares so k must be a perfect square.
 */

public class Problem131 {
	static ArrayList<Integer> primes = new ArrayList<Integer>();
	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
		int max = 1000000;
		generatePrimes(max);
		int count = 0;
		for(int i = 2; i < primes.size(); i++){ // start at the second index since p = 3 causes a problem and I know 2 and 3 don't work
			long p = (long) primes.get(i);
			for(long rootk = (long) Math.floor(Math.sqrt(p/3L)); rootk >= 1; rootk--){
				long k = rootk * rootk;
				long a = p - 3L *k;
				long b = 3L*(-1)*k*k;
				long discriminant = k*(4*p - 3*k);
				long sqrt = sqrt(discriminant);
				if(sqrt != -1){
					if((b * (-1) + k*sqrt) % (a*2) == 0){ // other root is always negative
						count++;
						System.out.println(sqrt(k));
						break;
					} 
				}
				if((b * (-1) + k*sqrt) < (a*2)) break;
			}
		}
		System.out.println(count);
		System.out.println(System.currentTimeMillis() - startTime);
	}
	public static long sqrt(long x){
		long sqrt = (long)Math.round(Math.sqrt(x));
		if(sqrt*sqrt == x){
			return sqrt;
		} 
		return -1;
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
