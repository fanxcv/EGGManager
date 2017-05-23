package com.wx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wx.entity.Line;
import com.wx.entity.User;
import com.wx.service.OVService;
import com.wx.util.ServletUtils;

@Controller
@RequestMapping("/Admin/Line")
public class LineController extends ServletUtils {

	@Autowired
	private OVService service;

	@RequestMapping(value = "/getLine")
	public ModelAndView select(HttpSession session) {
		ModelAndView view = new ModelAndView("/admin/line/list");
		User logged = (User) session.getAttribute("logged");
		String id = null;
		if ("1".equals(logged.getRole()) || "2".equals(logged.getRole()))
			id = logged.getId();
		else
			id = logged.getU_u_id();
		List<Map<String, String>> list = service.findLineList(id);
		if (list != null && list.size() != 0) {
			view.addObject("list", list);
		} else {
			view.addObject("error", "没有找到线路文件！");
		}
		return view;
	}

	@ResponseBody
	@RequestMapping(value = "/addLine", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String add(@RequestParam String cid, @RequestParam String name, @RequestParam String flag,
			@RequestParam String type, @RequestParam String value, @RequestParam String index) {
		index = notEmpty(index) ? index : "0";
		String error = check(cid, name, flag, type, value);
		if (error == null) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("u_id", cid);
			param.put("name", name);
			param.put("flag", flag);
			param.put("type", type);
			param.put("index", index);
			param.put("value", delNnRr(value));
			service.addLine(param);
			error = "添加成功";
		}
		return "[\"" + error + "\"]";
	}

	@ResponseBody
	@RequestMapping(value = "/editLine/get", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String getEdit(@RequestParam String id) {
		if (!notEmpty(id))
			return "";
		Line line = service.findLineById(id);
		return gson.toJson(line);
	}

	@ResponseBody
	@RequestMapping(value = "/editLine/update", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String setEdit(@RequestParam String id, @RequestParam String name, @RequestParam String value,
			@RequestParam String index) {
		index = notEmpty(index) ? index : "0";
		String error = check(id, name, "1", "1", value);
		if (error == null) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", id);
			param.put("name", name);
			param.put("index", index);
			param.put("value", delNnRr(value));
			service.updateLine(param);
			error = "修改成功";
		}
		return "[\"" + error + "\"]";
	}

	@ResponseBody
	@RequestMapping(value = "/delLine", method = RequestMethod.POST)
	public void delete(@RequestParam String id) {
		service.delLine(id);
	}

	private String check(String cid, String name, String flag, String type, String value) {
		String error = null;
		if (!notEmpty(cid)) {
			error = "未知错误";
		} else if (!notEmpty(name)) {
			error = "名称不能为空";
		} else if (!notEmpty(flag) && !isNumeric(flag)) {
			error = "线路归属错误";
		} else if (!notEmpty(type) && !isNumeric(type)) {
			error = "线路类型错误";
		} else if (!notEmpty(value)) {
			error = "线路内容不能为空";
		} else if (name.length() > 32) {
			error = "名称最大长度32位";
		}
		return error;
	}

	private String delNnRr(String str) {
		String[] lines = str.replaceAll("((\r\n)|\n)[\\s\t ]*(\\1)+", "$1").split("\n");
		StringBuffer sb = new StringBuffer();
		for (final String line : lines) {
			if (!line.trim().startsWith("#"))
				sb.append(line.trim()).append("\r\n");
		}
		if (str.contains("[MTD]") || str.contains("\\[MTD\\]")) {
			return sb.toString().replaceAll("((\r\n)|\n)", "\\\\r\\\\n").replaceAll(";\\\\r\\\\n", ";\r\n");
		} else {
			return sb.toString().replaceAll("((\r\n)|\n)", "\r\n");
		}
	}

}
