package com.wx.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wx.entity.User;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		if (uri.contains("Api") || uri.contains("login") || uri.contains("register") || uri.contains("error")
				|| uri.contains("logout") || uri.contains(".css") || uri.contains(".js") || uri.contains("img")) {
			return true;
		} else {
			HttpSession session = request.getSession();
			User logedUser = (User) session.getAttribute("logged");
			if (logedUser != null && !"0".equals(logedUser.getRole())) {
				return true;
			}
			response.sendRedirect(request.getContextPath() + "/login");
		}
		return false;
	}
}
