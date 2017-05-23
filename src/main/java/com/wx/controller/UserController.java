package com.wx.controller;

import com.wx.entity.User;
import com.wx.service.OVService;
import com.wx.util.ServletUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Admin/User")
public class UserController extends ServletUtils {

	@Autowired
	private OVService service;

	@ResponseBody
	@RequestMapping(value = "/getUser/{flag}", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String select(HttpSession session, @PathVariable String flag) {
		Map<String, Object> param = new HashMap<String, Object>();
		User logged = (User) session.getAttribute("logged");
		param.put("type", "0");
		switch (flag) {
		case "user":
			param.put("role", 0);
			break;
		case "agent":
			param.put("role", 3);
			param.put("u_u_id", logged.getId());
			break;
		}
		List<Map<String, Object>> list = service.userfindList(param);
		return gson.toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	public void delete(@PathVariable String id, @RequestParam(value = "ids[]", required = false) String[] ids) {
		if ("users".equals(id)) {
			if (ids != null && ids.length != 0) {
				service.userDels(Arrays.asList(ids));
			}
		} else {
			service.userDel(id);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/addUser", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String add(@RequestParam String cid, @RequestParam String username, @RequestParam String password,
			@RequestParam(value = "remarks", required = false) String remarks, @RequestParam String group) {
		String error = null;
		if (service.userfindByName(username) == null) {
			Map<String, Object> param = new HashMap<>();
			param.put("username", username);
			param.put("password", password);
			param.put("remarks", remarks);
			param.put("key", randomStr());
			param.put("group", group);
			param.put("u_u_id", cid);
			param.put("role", "3");
			param.put("id", "");
			service.userAdd(param);
			service.settingAdd(param.get("id"));
			error = "添加成功";
		} else {
			error = "用户名已使用";
		}
		return "[\"" + error + "\"]";
	}

	@ResponseBody
	@RequestMapping(value = "/addAdmin", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String addAdmin(@RequestParam String username, @RequestParam String password,
			@RequestParam(value = "remarks", required = false) String remarks) {
		String error;
		if (service.userfindByName(username) == null) {
			Map<String, Object> param = new HashMap<>();
			param.put("due_time", upTime(new Date(), 31));
			param.put("username", username);
			param.put("password", password);
			param.put("remarks", remarks);
			param.put("key", randomStr());
			param.put("u_u_id", "1");
			param.put("role", "2");
			param.put("id", "");
			service.userAdd(param);
			service.settingAdd(param.get("id"));
			error = "添加成功";
		} else {
			error = "用户名已使用";
		}
		return "[\"" + error + "\"]";
	}

	@ResponseBody
	@RequestMapping(value = "/editUser/get", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String getEdit(@RequestParam String eid) {
		User user = service.getUserById(eid);
		if (user != null && user.getId() != null) {
			return gson.toJson(user);
		}
		return "";
	}

	@ResponseBody
	@RequestMapping(value = "/editUser/update", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String setEdit(@RequestParam String cid, @RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "remarks", required = false) String remarks,
			@RequestParam(value = "locked", required = false) String locked,
			@RequestParam(value = "money", required = false) String money,
			@RequestParam(value = "group", required = false) String group) {
		String error = null;
		Map<String, Object> param = new HashMap<String, Object>();
		if (notEmpty(money))
			param.put("money", Integer.parseInt(money) * 100);
		param.put("username", username);
		param.put("password", password);
		param.put("remarks", remarks);
		param.put("locked", locked);
		param.put("group", group);
		param.put("id", cid);
		service.userUpdate(param);
		error = "修改成功";
		return "[\"" + error + "\"]";
	}

	private String randomStr() {
		String val = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		StringBuffer str = new StringBuffer();
		Random random = new Random();
		for (int i = 0; i < 24; i++) {
			int num = random.nextInt(62);
			str.append(val.charAt(num));
		}
		return str.toString();
	}

}
