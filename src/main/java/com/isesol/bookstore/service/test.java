package com.isesol.bookstore.service;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.isesol.bookstore.POJO.User;

public class test {
	
	public static void main(String[] args){
		
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		
	//	userService userService = (userService) applicationContext.getBean("userServiceImpl");
		
//		User user = new User();
	//	user.setId(10000);
	//	user.setName("11111");
		
	//	userService.addUser(user);
		
		String[] strings = applicationContext.getBeanDefinitionNames();
		for(String str:strings){
			
			System.out.println(str);
		}
		
	}

}
