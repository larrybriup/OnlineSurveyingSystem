package com.eagle.service;

import java.util.List;

import com.eagle.common.bean.User;


public interface UserService {
	void register(User user) throws Exception;
	User login(String name,String password) throws Exception;
	void logout(String name,String password) throws Exception;
	void modifyUser(User user) throws Exception;
	void deleteUser(long id) throws Exception;
	User findUserByName(String name) throws Exception;
	User findUserById(long id) throws Exception;
	List<User> findAllUsers() throws Exception;
}
