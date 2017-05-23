package com.wx.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wx.entity.User;
import com.wx.service.OVService;
import com.wx.util.ServletUtils;

@Controller
@RequestMapping("/LoginCtrl")
public class LoginController extends ServletUtils {

	@Autowired
	private OVService service;

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		String error = check(username, password);
		if (error == null) {
			User user = service.login(username, password);
			if (user != null && user.getId() != null) {
				session.setAttribute("logged", user);
				return new ModelAndView("redirect:/LoginCtrl/index.do");
			} else {
				error = "登录错误";
			}
		}
		ModelAndView model = new ModelAndView("login");
		model.addObject("error", error);
		return model;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	@RequestMapping("/index.do")
	public ModelAndView index(HttpSession session) {
		Map<String, Object> param = new HashMap<String, Object>();
		User user = (User) session.getAttribute("logged");
		ModelAndView model = new ModelAndView("index");
		user = service.getUserById(user.getId());
		session.setAttribute("logged", user);
		String all = "0";
		String code = "0";
		String daili = "0";
		code = service.codeCount(user.getId());
		param.put("u_u_id", user.getId());
		all = service.userCount(param);
		param.put("role", 3);
		daili = service.userCount(param);
		model.addObject("all", all);
		model.addObject("code", code);
		model.addObject("daili", daili);
		model.addObject("indexExplain", service.getIndexExplain(user.getU_u_id()));
		return model;
	}

	private String check(String username, String password) {
		String loginError = null;
		if (!notEmpty(username)) {
			loginError = "名称不能为空";
		} else if (!notEmpty(password)) {
			loginError = "密码不能为空";
		} else if (username.length() < 3 || username.length() > 16) {
			loginError = "名称长度为3~16位";
		} else if (password.length() < 3 || password.length() > 16) {
			loginError = "密码长度为3~16位";
		}

		return loginError;
	}
}
