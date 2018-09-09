package com.isesol.bookstore.dao;

import java.util.List;

import com.isesol.bookstore.POJO.User;

public interface userMapper {
	
	public int addUser(User user);
	
	public List<User> getUserList(User user);
	
	public int updateUser(User user);
	
	public User getUser(User user);
	
	public int deleteUser(User user);

}
