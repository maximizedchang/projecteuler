package euler;

public class Problem185Guess implements Comparable<Problem185Guess>{
	private int[] guess;
	private int distance;
	public Problem185Guess(int[] input){
		guess = new int[input.length];
		for(int i = 0; i < input.length; i++){
			guess[i] = input[i];
		}
	}
	public int[] getGuess() {
		return guess;
	}
	public void setGuess(int[] guess) {
		this.guess = guess;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public int compareTo(Problem185Guess o) {
		return distance - o.getDistance();
	}
}
