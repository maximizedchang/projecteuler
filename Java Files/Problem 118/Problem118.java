package euler;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

/*
 * Solution: 44680
 * Time: 6.095 seconds
 */

public class Problem118 {
	static HashMap<Integer, Integer> primeMap = new HashMap<Integer, Integer>();
	static ArrayList<Integer> primes = new ArrayList<Integer>();
	static ArrayList<Integer> orderedDigits = new ArrayList<Integer>();
	
	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
		int max = 100000000; // since there are no pandigital nine digit primes (always divisible by 3)
		generatePrimes(max);
		for(int i = 0; i < primes.size(); i++){
			int prime = primes.get(i);
			int ordered = noRepeatingDigits(prime);
			if(ordered != 0){
				if(primeMap.containsKey(ordered)){
					primeMap.put(ordered, primeMap.get(ordered).intValue() + 1);
				} else {
					primeMap.put(ordered, 1);
					orderedDigits.add(ordered);
				}
			}
		}
		Collections.sort(orderedDigits);
		int count = 0;
		for(int i = 0; i < orderedDigits.size(); i++){
			if(orderedDigits.get(i) > 10000) break;
			boolean[] seenDigits = new boolean[10];
			int unseenDigits = 9;
			String number = "" + orderedDigits.get(i);
			for(int index = 0; index < number.length(); index++){
				seenDigits[number.charAt(index) - '0'] = true;
				unseenDigits--;
			}
			ArrayList<Integer> possibleNextNumbers = new ArrayList<Integer>();
			for(int j = i + 1; j < orderedDigits.size(); j++){
				String nextNumber = "" + orderedDigits.get(j);
				boolean possible = true;
				for(int index = 0; index < nextNumber.length(); index++){
					if(seenDigits[nextNumber.charAt(index) - '0']){
						possible = false; 
						break;
					}
				}
				if(possible){
					possibleNextNumbers.add(orderedDigits.get(j));
				}
			}
			count += countPossibleSets(possibleNextNumbers, seenDigits, unseenDigits) * primeMap.get(orderedDigits.get(i)).intValue();
		}
		System.out.println(count);
		System.out.println(System.currentTimeMillis() - startTime);
	}
	
	public static int countPossibleSets(ArrayList<Integer> remainingKeys, boolean[] seenDigits, int unseenDigits){
		if(unseenDigits == 0){
			return 1;
		}
		int count = 0;
		for(int i = 0; i < remainingKeys.size(); i++){
			String number = "" + remainingKeys.get(i);
			if(number.length() > unseenDigits) break;
			boolean[] nextSeen = new boolean[10];
			for(int index = 0; index < 10; index++){
				nextSeen[index] = seenDigits[index];
			}
			boolean possible = true;
			for(int index = 0; index < number.length(); index++){
				if(nextSeen[number.charAt(index) - '0']){
					possible = false;
					break;
				}
				nextSeen[number.charAt(index) - '0'] = true;
			}
			if(!possible) continue;
			ArrayList<Integer> possibleNextNumbers = new ArrayList<Integer>();
			for(int j = i + 1; j < remainingKeys.size(); j++){
				String nextNumber = "" + remainingKeys.get(j);
				possible = true;
				for(int index = 0; index < nextNumber.length(); index++){
					if(nextSeen[nextNumber.charAt(index) - '0']){
						possible = false; 
						break;
					}
				}
				if(possible){
					possibleNextNumbers.add(remainingKeys.get(j));
				}
			}
			count += countPossibleSets(possibleNextNumbers, seenDigits, unseenDigits - number.length()) * primeMap.get(remainingKeys.get(i)).intValue();
		}
		return count;
	}
	
	// Also checks for zeroes
	public static int noRepeatingDigits(int num){
		boolean[] digits = new boolean[10];
		String number = "" + num;
		digits[0] = true;
		for(int i = 0; i < number.length(); i++){
			if(digits[number.charAt(i) - '0']) return 0;
			digits[number.charAt(i) - '0'] = true;
		} 
		int result = 0;
		for(int i = 1; i < 10; i++){
			if(digits[i]){
				result = result* 10 + i;
			}
		}
		return result;
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
