package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BootBoardApplication {
	
	// 해당 class 가 있는 패키지 하위에 있는 모든 패키지의 class 들을
	//Bean(객체) 으로 만들어주는 역할 
	public static void main(String[] args) {
		SpringApplication.run(BootBoardApplication.class, args);
	}

}
