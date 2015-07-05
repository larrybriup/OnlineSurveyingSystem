package com.eagle.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.eagle.common.bean.SU;
import com.eagle.dao.SUDao;

public class SUDaoImpl implements SUDao {
	private HibernateTemplate temp;

	public void setTemp(HibernateTemplate temp) {
		this.temp = temp;
	}

	public SU findSU() throws Exception {
		List list = temp.find("from SU");
		if(list.size()!=0){
			return (SU) list.get(0);
		}
		return null;
	}

	public void saveSU(SU su) throws Exception {
		temp.save(su);
	}

	public void saveOrUpdateSU(SU su) throws Exception {
		temp.saveOrUpdate(su);
	}


}
