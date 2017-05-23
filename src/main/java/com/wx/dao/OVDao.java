package com.wx.dao;

import java.util.List;
import java.util.Map;

import com.wx.entity.Line;
import com.wx.entity.User;

public interface OVDao {
	User userfind(Map<String, Object> param);

	String codeCount(String id);

	String userCount(Map<String, Object> param);

	String getIndexExplain(String id);

	List<Map<String, Object>> userfindList(Map<String, Object> param);

	List<User> userfindListById(List<String> param);

	void userDels(List<String> asList);

	void userDel(String id);

	List<Map<String, String>> findLineList(String u_u_id);

	void addLine(Map<String, Object> param);

	Line findLineById(String id);

	void delLine(String id);

	void updateLine(Map<String, Object> param);

	List<Map<String, Object>> findPackList(Map<String, Object> param);

	void delPack(String id);

	List<Map<String, Object>> findGroupList(String id);

	void addGroup(Map<String, Object> param);

	void delGroup(String id);

	void addPack(Map<String, Object> param);

	Map<String, Object> findPackById(String id);

	void updatePack(Map<String, Object> param);

	List<String> getCodeByBatch(Map<String, Object> param);

	Map<String, Long> findInfo(Map<String, Object> param);

	void userUpdate(Map<String, Object> param);

	void addCode(List<Map<String, Object>> list);

	List<Map<String, Object>> findCodeGroup(String id);

	void addCode_Info(Map<String, Object> param);

	void updateSetting(Map<String, Object> param);

	void userAdd(Map<String, Object> param);

	void settingAdd(Object object);

}
