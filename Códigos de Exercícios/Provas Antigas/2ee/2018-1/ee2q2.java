
public class EE2Q2 {

    public static void main(String[] args) throws InterruptedException {
        bloQ bq = new bloQ(5);
        (new Thread(new Cons(bq))).start();
        (new Thread(new Prod(bq))).start();
    }

}

class Prod implements Runnable {

    private bloQ bq;

    public Prod(bloQ bq) {
        this.bq = bq;
    }

    public void run() {
        while (true) {
            try {
                this.bq.push((int) (Math.random() * 100));
                Thread.sleep(100 + (int) (Math.random() * 100));
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}

class Cons implements Runnable {

    private bloQ bq;

    public Cons(bloQ bq) {
        this.bq = bq;
    }

    public void run() {
        while (true) {
            try {
                System.out.println(this.bq.pop());
                Thread.sleep(200 + (int) (Math.random() * 100));
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}

class bloQ {
    private int[] fila;
    private int size;

    public bloQ(int size) {
        this.fila = new int[size];
        this.size = 0;
    }

    public synchronized void push(int valor) throws InterruptedException {
        while (this.size == this.fila.length) {
            System.out.println("cheia, bloqueando!!");
            wait();
        }
        this.fila[this.size++] = val;
        notifyAll();
    }

    public synchronized int pop() throws InterruptedException {
        while (this.size == 0) {
            System.out.println("fila vazia!");
            wait();
        }
        int ret = this.fila[0];
        for (int i = 0; i < this.size - 1; i++) {
            this.fila[i] = this.fila[i + 1];
        }
        this.size--;
        notifyAll();
        return ret;
    }

    public synchronized int getSize() {
        return this.size;
    }
}

/*
 * import java.util.LinkedList; import java.util.Queue;
 * 
 * public class EE2Q2 { public static void main(String[] args) { final
 * BlockingQueue<Integer> bq = new BlockingQueue<>();
 * 
 * // Consumidor new Thread(() -> { // noinspection InfiniteLoopStatement while
 * (true) System.out.println(bq.poll()); }).start();
 * 
 * // Produtor new Thread(() -> { // noinspection InfiniteLoopStatement for (int
 * i = 0; true; ++i) { bq.add(i); try { Thread.sleep(1000); } catch
 * (InterruptedException ignored) { } } }).start(); }
 * 
 * public static class BlockingQueue<T> { private final Queue<T> content;
 * 
 * public BlockingQueue() { this.content = new LinkedList<>(); }
 * 
 * void add(T i) { synchronized (this.content) { this.content.add(i);
 * 
 * this.content.notify(); } }
 * 
 * public T peek() { while (true) synchronized (this.content) { if
 * (!this.content.isEmpty()) return this.content.peek();
 * 
 * try { this.content.wait(); } catch (InterruptedException ignored) { } } }
 * 
 * public T poll() { while (true) synchronized (this.content) { if
 * (!this.content.isEmpty()) return this.content.poll();
 * 
 * try { this.content.wait(); } catch (InterruptedException ignored) { } } } } }
 */