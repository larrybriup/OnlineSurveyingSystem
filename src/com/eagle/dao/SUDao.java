package com.eagle.dao;

import com.eagle.common.bean.SU;

public interface SUDao {
	SU findSU() throws Exception;
	void saveSU(SU su) throws Exception;
	void saveOrUpdateSU(SU su) throws Exception;
}
