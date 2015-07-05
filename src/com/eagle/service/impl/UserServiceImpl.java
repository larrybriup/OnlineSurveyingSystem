package com.eagle.service.impl;

import java.util.Date;
import java.util.List;

import com.eagle.common.bean.User;
import com.eagle.common.util.MD5;
import com.eagle.dao.UserDao;
import com.eagle.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public void register(User user) throws Exception {
		userDao.saveUser(user);
		
	}

	public User login(String name, String password) throws Exception {
		User findUserByName = userDao.findUserByName(name);
		if (findUserByName==null) {
			throw new Exception("没有名字为："+name+"的用户");
		}
		if (!findUserByName.getPassword().equals(MD5.getMD5Str(password))) {
			throw new Exception("密码不正确！");
		}
		findUserByName.setIsonline(1);
		findUserByName.setLatestdate(new Date());
		userDao.saveOrUpdateUser(findUserByName);
		return findUserByName;
	}

	public void modifyUser(User user) throws Exception {
		
	}

	public void deleteUser(long id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public User findUserByName(String name) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public User findUserById(long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<User> findAllUsers() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void logout(String name, String password) throws Exception {
		// TODO Auto-generated method stub
		User findUserByName = userDao.findUserByName(name);
		if (findUserByName==null) {
			throw new Exception("没有名字为："+name+"的用户");
		}
		findUserByName.setIsonline(0);
	}


}
