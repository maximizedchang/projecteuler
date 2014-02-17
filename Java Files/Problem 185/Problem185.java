package euler; 

import java.util.Comparator;
import java.util.HashSet;
import java.util.PriorityQueue;

/*
 * Solution: 4640261571849533
 * Time: 27 seconds
 * Djistra
 */

public class Problem185 {
	/*
	 * Args: [Guess #1] [# correct for Guess #1] [Guess #2] ....
	 */
	public static int NUMBER_OF_DIGITS = 16;
	public static int[][] guessArray;
	public static int numberOfGuesses;
	public static int[] correct;
	public static void main (String[] args) {
		numberOfGuesses = args.length/2;
		guessArray = new int[numberOfGuesses][NUMBER_OF_DIGITS];
		correct = new int[numberOfGuesses];
		processInput(args, guessArray, correct, numberOfGuesses);
		boolean[][] possibleDigits = new boolean[NUMBER_OF_DIGITS][10];
		for(int i = 0; i < NUMBER_OF_DIGITS; i++){
			for(int j = 0; j < 10; j++){
				possibleDigits[i][j] = true;
			}
		}
		possibleDigits[0][0] = false;
		for(int i = 0; i < numberOfGuesses; i++){
			if(correct[i] == 0){
				for(int j = 0; j < NUMBER_OF_DIGITS; j++){
					possibleDigits[j][guessArray[i][j]] = false;
				}
			}
		}
		for(int j = 0; j < NUMBER_OF_DIGITS; j++){
			boolean[] digits = new boolean[10];
			int numberOfDigitsSeen = 0;
			for(int i = 0; i < numberOfGuesses; i++){
				if(!digits[guessArray[i][j]]){
					digits[guessArray[i][j]]= true;
					numberOfDigitsSeen++;
				}
			}
			if(numberOfDigitsSeen < 9){
				for(int i = 0; i < 10; i++){
					if(!digits[i]){
						possibleDigits[j][i] = false;
					}
				}
			}
		}
		PriorityQueue<Problem185Guess> closestSolution = new PriorityQueue<Problem185Guess>();
		HashSet<Long> seen = new HashSet<Long>();
		for(int digit = 1; digit < 10; digit++){
			int[] digits = new int[16];
			for(int i = 0; i < 16; i++){
				digits[i] = digit;
			}
			Problem185Guess firstGuess = new Problem185Guess(digits);
			firstGuess.setDistance(determineDistance(digits));			
			closestSolution.add(firstGuess);			
			seen.add(convertGuessToLong(firstGuess.getGuess()));
		}
		while(!closestSolution.isEmpty()){
			Problem185Guess closestGuess = closestSolution.poll();
			if(closestGuess.getDistance() == 0){
				System.out.println(convertGuessToLong(closestGuess.getGuess()) + ": " + closestGuess.getDistance());
				System.out.println("FOUND IT");
				break;
			} 
			int[] closestGuessArray = closestGuess.getGuess();
			for(int i = 0; i < NUMBER_OF_DIGITS; i++){				
				int originalDigit = closestGuessArray[i];
				for(int digit = 0; digit <= 9; digit++){
					if(possibleDigits[i][digit] && digit != originalDigit){
						int[] newGuessArray = new int[NUMBER_OF_DIGITS];
						for(int j = 0; j < NUMBER_OF_DIGITS; j++){
							newGuessArray[j] = closestGuessArray[j];
						}
						newGuessArray[i] = digit;
						if(!seen.contains(convertGuessToLong(newGuessArray))){
							seen.add(convertGuessToLong(newGuessArray));
							Problem185Guess newGuess = new Problem185Guess(newGuessArray);
							newGuess.setDistance(determineDistance(newGuessArray));
							closestSolution.add(newGuess);
						}
					}
				}
			}
		}
	}
	
	public static long convertGuessToLong(int[] guess){
		long result = 0L;
		for(int i = 0; i < guess.length; i++){
			result = result *10L + guess[i];
		}
		return result;
	}
	
	public static int determineDistance(int[] guess){
		int distance = 0;
		for(int i = 0; i < numberOfGuesses; i++){
			int totalMatches = 0;
			for(int j = 0; j < NUMBER_OF_DIGITS; j++){
				if(guess[j] == guessArray[i][j]){
					totalMatches++;
				}
			}
			distance += Math.abs(totalMatches - correct[i]);
		}
		return distance;
	}

	public static Comparator<Problem185Guess> MasterMindComparator = new Comparator<Problem185Guess>(){
		public int compare(Problem185Guess a, Problem185Guess b){
			return a.getDistance() - b.getDistance();
		}
	};
	
	private static void processInput(String[] args, int[][] guessArray,
			int[] correct, int numberOfGuesses) {
		for(int i = 0; i < numberOfGuesses; i++){
			String guess = args[2*i];
			for(int digitIndex = 0; digitIndex < NUMBER_OF_DIGITS; digitIndex++){
				guessArray[i][digitIndex] = (int)(guess.charAt(digitIndex) - '0');
			}
			correct[i] = Integer.parseInt(args[2*i + 1]);
		}
	}
}
