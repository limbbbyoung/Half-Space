package com.halfspace.test;


import java.util.Scanner;

public class test {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		String A = sc.nextLine();
		
		String B = A.toUpperCase();
		
		
		
		for(int i = 0; i < B.length(); i ++) {
			
			int count = 0;
			
			if(B.contains(String.valueOf(B.charAt(i))) == true) {
				count += 1;
			}
			
		}
		
		

	}

}
