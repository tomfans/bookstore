package com.isesol.bookstore.service;

import java.util.List;

import com.isesol.bookstore.POJO.Dept;
import com.isesol.bookstore.POJO.User;

public interface userService {

	public boolean addUser(User user);

	public List<User> getUserList(User user);

	public boolean updateUser(User user);

	public User getUser(User user);
	
	public boolean deleteUser(User user);
	
	public List<Dept> getDeptList(Dept dept);

}
