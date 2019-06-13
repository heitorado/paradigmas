import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class EE2Q3 {
    public static void main(String[] args) {
        new Padaria();
    }

    public static class Padaria {
        public final BlockingQueue<Paes> forno;

        public Padaria() {
            this.forno = new LinkedBlockingQueue<>();

            // Produtor
            new Thread(() -> {
                // noinspection InfiniteLoopStatement
                while (true) {
                    while (true)
                        synchronized (this.forno) {
                            if (this.forno.isEmpty())
                                break;

                            try {
                                this.forno.wait();
                            } catch (InterruptedException ignored) {
                            }
                        }
                    System.out.println("Forno vazio");

                    for (int i = 0; i < 5; ++i)
                        try {
                            Thread.sleep(500);
                            this.forno.put(new Paes());
                            synchronized (this.forno) {
                                this.forno.notify();
                            }

                            System.out.printf("%d / 50 pães no forno%n", (i + 1) * 10);
                        } catch (InterruptedException ignored) {
                        }
                }
            }).start();

            // Consumidor
            new Thread(() -> {
                // noinspection InfiniteLoopStatement
                while (true) {
                    while (true)
                        synchronized (this.forno) {
                            if (!this.forno.isEmpty())
                                break;

                            try {
                                this.forno.wait();
                            } catch (InterruptedException ignored) {
                            }
                        }

                    try {
                        Thread.sleep(2000);
                        this.forno.take();
                        synchronized (this.forno) {
                            this.forno.notify();
                        }

                        System.err.println("10 pães prontos");
                    } catch (InterruptedException ignored) {
                    }
                }
            }).start();
        }

        public static class Paes {
        }
    }
}
