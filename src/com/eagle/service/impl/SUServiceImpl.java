package com.eagle.service.impl;

import com.eagle.common.bean.SU;
import com.eagle.common.util.MD5;
import com.eagle.dao.SUDao;
import com.eagle.service.SUService;

public class SUServiceImpl implements SUService {
	private SUDao suDao;

	public void register(SU su) throws Exception {
		SU findSU = findSU();
		if (findSU != null)
			throw new Exception("对不起!您已经注册!注册账户为:" + findSU.getName());
		suDao.saveSU(su);
	}

	public SU login(String name, String password) throws Exception {
		SU findSU = findSU();
		if (findSU == null)
			throw new Exception("对不起!您还没有注册!请先注册!");
		if (!findSU.getName().equals(name))
			throw new Exception("对不起!用户名不正确!请重新登陆!");
		if (!findSU.getPassword().equals(MD5.getInstance().getMD5ofStr(password)))
			throw new Exception("对不起!密码不正确!请重新登陆!");
		return findSU;
	}

	public SU findSU() throws Exception {
		SU findSU = suDao.findSU();

		return findSU;
	}

	public void saveOrUpdateSU(SU su) throws Exception {
		suDao.saveOrUpdateSU(su);
	}

	public void setSuDao(SUDao suDao) {
		this.suDao = suDao;
	}

}
