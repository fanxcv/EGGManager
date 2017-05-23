package com.wx.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wx.dao.ApiDao;
import com.wx.service.ApiService;
import com.wx.util.BaseUtils;

@Service
public class ApiServiceImpl extends BaseUtils implements ApiService {

	@Autowired
	private ApiDao dao;

	@Override
	public float findVersionByName(String str) {
		return dao.findVersionByName(str);
	}

	@Override
	public Map<String, Object> getAdminInfo(String str) {
		return dao.getAdminInfo(str);
	}

	@Override
	public Map<String, Object> getAppInfo(String decrypt) {
		return dao.getAppInfo(decrypt);
	}

	@Override
	public Map<String, String> getUserInfo(Map<String, Object> param) {
		return dao.getUserInfo(param);
	}

	@Override
	public void userUpdate(Map<String, Object> paramUp) {
		dao.userUpdate(paramUp);
	}

	@Override
	public void userAdd(Map<String, Object> param) {
		dao.userAdd(param);
	}

	@Override
	public List<Map<String, String>> findLineList(String val) {
		return dao.findLineList(val);
	}

	@Override
	public Map<String, String> findLine(String id) {
		return dao.findLine(id);
	}

	@Override
	public int findCodeTime(Map<String, Object> param) {
		return dao.findCodeTime(param);
	}

	@Override
	public void delCode(Map<String, Object> param) {
		dao.delCode(param);
	}

	@Override
	public Map<String, Object> getUId(String id) {
		return dao.getUId(id);
	}
}