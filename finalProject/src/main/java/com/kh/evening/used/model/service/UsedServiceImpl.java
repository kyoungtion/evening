package com.kh.evening.used.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.used.model.dao.UsedDao;




@Service("uService")
public class UsedServiceImpl implements UsedService{

	@Autowired
	private UsedDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
