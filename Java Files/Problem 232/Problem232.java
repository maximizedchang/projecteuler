package euler;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class Problem232 {
	
	/*
	 * Solution: 0.83648556
	 * Time: 0.074 seconds
	 */
	
	static double[][] probability2Wins = new double[100][100];
	
	public static void main (String[] args) {	
		long startTime = System.currentTimeMillis();
		for(int player2Score = 99; player2Score >= 0; player2Score--){
			for(int player1Score = 99; player1Score >= 0; player1Score--){
				double maxChance = 0; 
				int T = 1;
				while(player2Score + Math.pow(2, T - 1) < 100){
					double numerator = Math.pow(0.5, T + 1)
							*(calculateProb(player1Score + 1, player2Score + (int)Math.pow(2, T - 1)) 
									+ calculateProb(player1Score, player2Score + (int)Math.pow(2, T - 1))) 
									+ 0.5*(1 - Math.pow(0.5, T))*calculateProb(player1Score + 1, player2Score);
					double denominator = 1 - 0.5*(1 - Math.pow(0.5, T));
					double thisChance = numerator/denominator;
					if(thisChance > maxChance){
						maxChance = thisChance;
					}
					T++;
				}
				double numerator = Math.pow(0.5, T + 1)
						*(calculateProb(player1Score + 1, player2Score + (int)Math.pow(2, T - 1)) 
								+ calculateProb(player1Score, player2Score + (int)Math.pow(2, T - 1))) 
								+ 0.5*(1 - Math.pow(0.5, T))*calculateProb(player1Score + 1, player2Score);
				double denominator = 1 - 0.5*(1 - Math.pow(0.5, T));
				double thisChance = numerator/denominator;
				if(thisChance > maxChance){
					maxChance = thisChance;
				}
				probability2Wins[player1Score][player2Score] = maxChance;
			}
		}
		System.out.println(new BigDecimal(String.valueOf(0.5*probability2Wins[0][0] + 0.5*probability2Wins[1][0])).setScale(8, RoundingMode.HALF_UP));
		System.out.println(System.currentTimeMillis() - startTime);
	}
	public static double calculateProb(int score1, int score2){
		if(score2 >= 100) return 1;
		if(score1 == 100) return 0;
		return probability2Wins[score1][score2];
	}
}
