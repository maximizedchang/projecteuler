package euler;

/*
 * Solution: 95962097
 * Time: 2.881 seconds
 */

public class Problem188 {
	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
		int max = 100000000;
		long[] lastDigits = new long[max];
		lastDigits[0] = 1L;
		for(int i = 1; i < max; i++){
			lastDigits[i] = ((lastDigits[i - 1]*1777L) % ((long) max));
		}
		long index = 1;
		for(int i = 0; i < max; i++){
			index = lastDigits[(int)index];
		}
		System.out.println(index);
		System.out.println(System.currentTimeMillis() - startTime);
	}
}
