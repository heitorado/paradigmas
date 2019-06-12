public class Semaphore {
	private int contador;
	
	public Semaphore(int c){
		this.contador = c;
	}
	
	synchronized void up() {
		this.contador++;
		
		if(this.contador >= 0) {
			notifyAll();
		}
		
		return;
	}
	
	synchronized void down() throws InterruptedException {
		while(this.contador <= 0) {
			wait();
		}
		
		this.contador--;
		
		return;
	}
}