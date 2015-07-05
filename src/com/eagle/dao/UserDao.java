package com.eagle.dao;

import java.util.List;

import com.eagle.common.bean.User;

public interface UserDao {
	User findUserByName(String name) throws Exception;
	User findUserById(long id) throws Exception;
	List<User> findAllUsers() throws Exception;
	void saveUser(User user) throws Exception;
	void saveOrUpdateUser(User user) throws Exception;
	void deleteUser(long id) throws Exception;
}
