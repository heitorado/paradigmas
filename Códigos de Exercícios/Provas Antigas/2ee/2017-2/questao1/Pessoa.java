package questao1;

import java.util.Random;

public class Pessoa implements Runnable{
	
	public Random rgen = new Random();
	public static Conta contaBancariaFamilia = new Conta();
	private String nome;
	
	public Pessoa(String n) {
		nome = n;
	}

	public static void main(String[] args) throws InterruptedException {
		
		Thread mae = new Thread(new Pessoa("Mãe"));
		Thread pai = new Thread(new Pessoa("Pai"));
		Thread filho = new Thread(new Pessoa("Filho"));
		Thread filha = new Thread(new Pessoa("Filha"));
		Thread tio = new Thread(new Pessoa("Tio"));
		Thread tia = new Thread(new Pessoa("Tia"));
		
		mae.start();
		pai.start();
		filho.start();
		filha.start();
		tio.start();
		tia.start();
		
		mae.join();
		pai.join();
		filho.join();
		filha.join();
		tio.join();
		tia.join();
		
		System.out.println(contaBancariaFamilia.getSaldo());
	}

	@Override
	public void run() {
		int toDeposit = rgen.nextInt(5000);
		int toWithdraw = rgen.nextInt(5000);
		System.out.println(nome + " Depositou " + toDeposit);
        contaBancariaFamilia.depositar(toDeposit);
		System.out.println(nome + " Tentou Sacar " + toWithdraw);
		contaBancariaFamilia.sacar(toWithdraw);
	}

}
