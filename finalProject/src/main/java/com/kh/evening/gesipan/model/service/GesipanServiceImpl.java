package com.kh.evening.gesipan.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.gesipan.model.dao.GesipanDAO;


@Service("gService")
public class GesipanServiceImpl implements GesipanService{
	@Autowired
	private GesipanDAO gDAO;
}
