package com.wx.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wx.dao.OVDao;
import com.wx.entity.Line;
import com.wx.entity.User;
import com.wx.service.OVService;
import com.wx.util.BaseUtils;

@Service
public class OVServiceImpl extends BaseUtils implements OVService {

	@Autowired
	private OVDao dao;

	@Override
	public User login(String username, String password) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("username", username);
		param.put("password", password);
		User user = dao.userfind(param);
		if (user != null && user.getId() != null) {
			return user;
		}
		return null;
	}

	@Override
	public User getUserById(String id) {
		if (notEmpty(id)) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", id);
			return dao.userfind(param);
		}
		return null;
	}

	@Override
	public String codeCount(String id) {
		if (notEmpty(id))
			return dao.codeCount(id);
		return "0";
	}

	@Override
	public String userCount(Map<String, Object> param) {
		if (notEmptyMap(param))
			return dao.userCount(param);
		return "0";
	}

	@Override
	public String getIndexExplain(String id) {
		if (notEmpty(id))
			return dao.getIndexExplain(id);
		return "";
	}

	@Override
	public List<Map<String, Object>> userfindList(Map<String, Object> param) {
		if (notEmptyMap(param))
			return dao.userfindList(param);
		return null;
	}

	@Override
	public List<User> userfindListById(List<String> param) {
		if (notEmptyList(param))
			return dao.userfindListById(param);
		return null;
	}

	@Override
	public void userDels(List<String> asList) {
		dao.userDels(asList);
	}

	@Override
	public void userDel(String id) {
		if (notEmpty(id))
			dao.userDel(id);
	}

	@Override
	public List<Map<String, String>> findLineList(String u_u_id) {
		return dao.findLineList(u_u_id);
	}

	@Override
	public void addLine(Map<String, Object> param) {
		dao.addLine(param);
	}

	@Override
	public Line findLineById(String id) {
		return dao.findLineById(id);
	}

	@Override
	public void delLine(String id) {
		dao.delLine(id);
	}

	@Override
	public void updateLine(Map<String, Object> param) {
		dao.updateLine(param);
	}

	@Override
	public List<Map<String, Object>> findPackList(Map<String, Object> param) {
		return dao.findPackList(param);
	}

	@Override
	public void delPack(String id) {
		dao.delPack(id);
	}

	@Override
	public List<Map<String, Object>> findGroupList(String id) {
		return dao.findGroupList(id);
	}

	@Override
	public void addGroup(Map<String, Object> param) {
		dao.addGroup(param);
	}

	@Override
	public void delGroup(String id) {
		dao.delGroup(id);
	}

	@Override
	public void addPack(Map<String, Object> param) {
		dao.addPack(param);
	}

	@Override
	public Map<String, Object> findPackById(String id) {
		return dao.findPackById(id);
	}

	@Override
	public void updatePack(Map<String, Object> param) {
		dao.updatePack(param);
	}

	@Override
	public List<String> getCodeByBatch(Map<String, Object> param) {
		return dao.getCodeByBatch(param);
	}

	@Override
	public Map<String, Long> findInfo(Map<String, Object> param) {
		return dao.findInfo(param);
	}

	@Override
	public void userUpdate(Map<String, Object> param) {
		dao.userUpdate(param);
	}

	@Override
	public void addCode(List<Map<String, Object>> list) {
		dao.addCode(list);
	}

	@Override
	public List<Map<String, Object>> findCodeGroup(String id) {
		return dao.findCodeGroup(id);
	}

	@Override
	public void addCode_Info(Map<String, Object> param) {
		dao.addCode_Info(param);
	}

	@Override
	public void updateSetting(Map<String, Object> param) {
		dao.updateSetting(param);
	}

	@Override
	public void userAdd(Map<String, Object> param) {
		dao.userAdd(param);
	}

	@Override
	public User userfindByName(String username) {
		if (notEmpty(username)) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("username", username);
			return dao.userfind(param);
		}
		return null;
	}

	@Override
	public void settingAdd(Object object) {
		dao.settingAdd(object);
	}
}