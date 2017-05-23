package com.wx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wx.entity.User;
import com.wx.service.OVService;
import com.wx.util.ServletUtils;

@Controller
@RequestMapping("/Admin/Pack")
public class PackController extends ServletUtils {

	@Autowired
	private OVService service;

	@RequestMapping(value = "/getPack/{val}")
	public ModelAndView select(HttpSession session, @PathVariable String val) {
		ModelAndView view = new ModelAndView("/admin/package/list");
		Map<String, Object> param = new HashMap<String, Object>();
		User logged = (User) session.getAttribute("logged");
		if (notEmpty(val) && "admin".equals(val)) {
			param.put("u_id", logged.getId());
		} else {
			param.put("group", logged.getGroup());
			param.put("u_id", logged.getU_u_id());
		}
		List<Map<String, Object>> list = service.findPackList(param);
		if (list.size() != 0) {
			view.addObject("list", list);
		} else {
			view.addObject("error", "没有找到相关流量包！");
		}
		return view;
	}

	@ResponseBody
	@RequestMapping(value = "/addPack", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String add(@RequestParam String cid, @RequestParam String name, @RequestParam String time,
			@RequestParam String price, @RequestParam String group) {
		price = isNumeric(price) ? price : "1";
		String error = check(cid, name, time, group);
		if (error == null) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("u_id", cid);
			param.put("name", name);
			param.put("time", time);
			param.put("group", group);
			param.put("price", toSqlNumber(price));
			service.addPack(param);
			error = "添加成功";
		}
		return "[\"" + error + "\"]";
	}

	@ResponseBody
	@RequestMapping(value = "/editPack/get", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String getEdit(@RequestParam String id) {
		if (!notEmpty(id))
			return "";
		Map<String, Object> pack = service.findPackById(id);
		return gson.toJson(pack);
	}

	@ResponseBody
	@RequestMapping(value = "/editPack/update", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String setEdit(@RequestParam String id, @RequestParam String name, @RequestParam String time,
			@RequestParam String price, @RequestParam String group) {
		price = isNumeric(price) ? price : "1";
		String error = check(id, "name", "name", "group");
		if (error == null) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", id);
			param.put("name", name);
			param.put("time", time);
			param.put("group", group);
			param.put("price", toSqlNumber(price));
			service.updatePack(param);
			error = "修改成功";
		}
		return "[\"" + error + "\"]";
	}

	@ResponseBody
	@RequestMapping(value = "/delPack", method = RequestMethod.POST)
	public void delete(@RequestParam String id) {
		service.delPack(id);
	}

	private String check(String cid, String name, String time, String group) {
		String error = null;
		if (!notEmpty(cid)) {
			error = "未知错误";
		} else if (!notEmpty(name)) {
			error = "名称不能为空";
		} else if (!notEmpty(time) && !isNumeric(time)) {
			error = "有效时间错误";
		} else if (!notEmpty(group) && !isNumeric(group)) {
			error = "分组错误";
		} else if (name.length() > 32) {
			error = "名称最大长度32位";
		}
		return error;
	}

}
