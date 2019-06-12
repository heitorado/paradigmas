package questao2;

import java.util.concurrent.atomic.*;

//Conta bancária compartilhada por 6 pessoas
public class Conta{

 private AtomicInteger saldo = new AtomicInteger(0);

 public int depositar(int valor){
     return saldo.addAndGet(valor);
 }

 public int sacar(int valor){
	 return saldo.updateAndGet(saldo -> (saldo-valor) > 0  ? (saldo-valor) : saldo);
 }
 
 public int getSaldo() {
	 return saldo.get();
 }
}