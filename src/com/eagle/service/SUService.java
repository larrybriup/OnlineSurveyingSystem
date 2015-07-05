package com.eagle.service;

import com.eagle.common.bean.SU;

public interface SUService {
	void register(SU su) throws Exception;
	SU login(String name,String password) throws Exception;
	SU findSU() throws Exception;
	void saveOrUpdateSU(SU su) throws Exception;
}
