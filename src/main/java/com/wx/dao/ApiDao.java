package com.wx.dao;

import java.util.List;
import java.util.Map;

public interface ApiDao {

	float findVersionByName(String str);

	Map<String, Object> getAdminInfo(String str);

	Map<String, Object> getAppInfo(String decrypt);

	Map<String, String> getUserInfo(Map<String, Object> param);

	void userUpdate(Map<String, Object> paramUp);

	void userAdd(Map<String, Object> param);

	List<Map<String, String>> findLineList(String val);

	Map<String, String> findLine(String id);

	int findCodeTime(Map<String, Object> param);

	void delCode(Map<String, Object> param);

	Map<String, Object> getUId(String id);

}
