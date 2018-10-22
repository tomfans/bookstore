package com.isesol.bookstore.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.isesol.bookstore.POJO.Dept;
import com.isesol.bookstore.POJO.User;
import com.isesol.bookstore.dao.userMapper;

@Service
@Scope("prototype")
public class userServiceImpl implements userService {

	@Autowired
	private userMapper usermapper;

	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		int count = usermapper.addUser(user);
		if (count > 0) {
			return true;
		}
		return false;
	}
	

	public List<Dept> getDeptList(Dept dept) {
		// TODO Auto-generated method stub
		return usermapper.getDeptList(dept);
	}


	public List<User> getUserList(User user) {
		// TODO Auto-generated method stub
		if(user != null && user.getName() != null  && !user.getName().equals("")){
			user.setName("%" + user.getName() + "%");
		}
		
		
		
		return usermapper.getUserList(user);
	}

	@Override
	public boolean updateUser(User user) {
		
		int count = usermapper.updateUser(user);
		
		if(count > 0){
		
			System.out.println("update successful");
		}
		
		
		return false;
	}

	@Override
	public User getUser(User user) {
		// TODO Auto-generated method stub
		return usermapper.getUser(user);
	}

	@Override
	public boolean deleteUser(User user) {
		// TODO Auto-generated method stub
		
		int count = usermapper.deleteUser(user);
		if(count > 0) {
			
			return true;
		}
		return false; 
	}


}
