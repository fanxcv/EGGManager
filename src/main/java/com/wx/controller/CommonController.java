package com.wx.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wx.entity.User;
import com.wx.service.OVService;
import com.wx.util.DateUtil;
import com.wx.util.ServletUtils;

@Controller
@RequestMapping("/Common")
public class CommonController extends ServletUtils {

	@Autowired
	private OVService service;

	@RequestMapping(value = "/download/{flag}", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	@ResponseBody
	public String download(HttpSession session, HttpServletResponse response, @PathVariable String flag,
			@RequestParam(value = "ids[]", required = false) String[] ids) {
		if (ids != null && ids.length != 0) {
			StringBuffer str = new StringBuffer();
			str.append(DateUtil.getNowTime()).append("\r\n");
			List<User> list = service.userfindListById(Arrays.asList(ids));
			for (User user : list) {
				str.append(user.getUsername()).append("    ").append(user.getPassword()).append("\r\n");
			}
			if (str != null && str.length() != 0) {
				String filename = ((User) session.getAttribute("logged")).getUsername() + ".txt";
				super.download(response, str.toString(), filename);
			}
		} else {
			return "没有下载对象";
		}
		return "";
	}

	@RequestMapping(value = "/downloadCode/{batch}", produces = { "text/html;charset=UTF-8;" })
	@ResponseBody
	public String downloadCode(HttpSession session, HttpServletResponse response, @PathVariable String batch) {
		if (notEmpty(batch)) {
			User user = (User) session.getAttribute("logged");
			StringBuffer str = new StringBuffer();
			str.append(DateUtil.getNowTime()).append("\r\n");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("batch", batch);
			param.put("u_id", user.getId());
			List<String> list = service.getCodeByBatch(param);
			for (final String s : list) {
				str.append(s).append("\r\n");
			}
			if (str != null && str.length() != 0) {
				String filename = user.getUsername() + "Code.txt";
				super.download(response, str.toString(), filename);
			}
		} else {
			return "没有下载对象";
		}
		return "";
	}

}
