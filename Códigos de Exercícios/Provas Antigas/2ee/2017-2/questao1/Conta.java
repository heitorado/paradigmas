package questao1;

//Conta bancária compartilhada por 6 pessoas
public class Conta{

 private int saldo;

 public int depositar(int valor){
     synchronized(this){
         saldo = saldo + valor;
         return saldo;
     }
 }

 public int sacar(int valor){
     synchronized(this){
         if((saldo-valor) > 0){
             saldo = saldo - valor;
         }
         return saldo;
     }
 }
 
 public int getSaldo() {
	 return saldo;
 }
}