package com.eagle.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.eagle.common.bean.User;
import com.eagle.dao.UserDao;

public class UserDaoImpl implements UserDao {
	private HibernateTemplate temp;

	public void setTemp(HibernateTemplate temp) {
		this.temp = temp;
	}

	public User findUserByName(String name) throws Exception {
		List<User> find = temp.find("from User where name=?",name);
		if (find.size()!=0) {
			return find.get(0);
		}
		return null;
	}

	public User findUserById(long id) throws Exception {
		List<User> find = temp.find("from User where id=?",id);
		if (find.size()!=0) {
			return find.get(0);
		}
		return null;
	}

	public List<User> findAllUsers() throws Exception {
		List<User> find = temp.find("from User");
		if (find.size()!=0) {
			return find;
		}
		
		return null;
	}

	public void saveUser(User user) throws Exception {
		temp.save(user);
		
	}

	public void saveOrUpdateUser(User user) throws Exception {
		temp.saveOrUpdate(user);
		
	}

	public void deleteUser(long id) throws Exception {
		temp.delete("delete from User where id=?",id);
	}



}
