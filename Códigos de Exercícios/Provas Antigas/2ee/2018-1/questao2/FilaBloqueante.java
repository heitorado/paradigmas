public class FilaBloqueante {
	private int[] queue;
	private int length;
	private int size;
	
	public FilaBloqueante(int maxSize) {
		this.queue = new int[maxSize];
		this.length = 0;
		this.size = maxSize;
	}
	
	public synchronized void put(int value) throws InterruptedException {
		while(this.length == this.size-1) {
			wait();
		}
		
		this.queue[this.length++] = value;
		
		if(this.length > 0) {
			notifyAll();
		}
	}
	
	public synchronized int take() throws InterruptedException {
		while(this.length == 0) {
			wait();
		}
		
		int ret = this.queue[0];
		this.tailShift();
		
		if(this.length == 0) {
			notifyAll();
		}
		
		return ret;
	}
	

	private void tailShift() {
		int i;
		this.length--;
		for(i = 1; i <= this.length; ++i) {
			this.queue[i-1] = this.queue[i];
		}
		return;
	}
}