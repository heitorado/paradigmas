
public class EE2Q1 {
    public static void main(String[] args) {
        final Vector vector = new Vector(10);

        for (final int i : new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 })
            new Thread(() -> {
                // noinspection InfiniteLoopStatement
                for (int j = 0; true; j = ++j % 10) {
                    vector.swap(i, j);
                    vector.set(j, i);
                    System.out.println(vector.get(j));

                    try {
                        Thread.sleep((i + 1) * 100);
                    } catch (InterruptedException ignored) {
                    }
                }
            }).start();
    }

    public static class Vector {
        private final int[] content;

        public Vector(int size) {
            this.content = new int[size];
        }

        public int get(int index) {
            synchronized (this.content) {
                return this.content[index];
            }
        }

        public void set(int index, int value) {
            synchronized (this.content) {
                this.content[index] = value;
            }
        }

        public void swap(int a, int b) {
            synchronized (this.content) {
                int i = this.content[a];
                this.content[a] = this.content[b];
                this.content[b] = i;
            }
        }
    }
}
