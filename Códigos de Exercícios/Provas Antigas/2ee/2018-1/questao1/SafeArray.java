public class SafeArray {
	private int[] sarray;
	
	public SafeArray(int size) {
		this.sarray = new int[size];
	}
	
	public synchronized int get(int index) {
		return this.sarray[index];
	}
	
	public synchronized void set(int index, int value) {
		this.sarray[index] = value;
		return;
	}
	
	public synchronized void swap(int originIndex, int destinationIndex) {
		int aux = this.sarray[originIndex];
		this.sarray[originIndex] = this.sarray[destinationIndex];
		this.sarray[destinationIndex] = aux;
		return;
	}
}