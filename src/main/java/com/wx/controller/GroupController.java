package com.wx.controller;

import com.wx.entity.User;
import com.wx.service.OVService;
import com.wx.util.ServletUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Admin/Group")
public class GroupController extends ServletUtils {

    @Autowired
    private OVService service;

    @RequestMapping(value = "/getGroup")
    public ModelAndView select(HttpSession session) {
        ModelAndView view = new ModelAndView("/admin/group/list");
        User logged = (User) session.getAttribute("logged");
        List<Map<String, Object>> list = service.findGroupList(logged.getId());
        if (list != null && list.size() != 0) {
            view.addObject("list", list);
        } else {
            view.addObject("error", "亲，你还没有创建分组的哟！");
        }
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/getGroupJson", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    public String selectJson(HttpSession session) {
        User logged = (User) session.getAttribute("logged");
        List<Map<String, Object>> list = service.findGroupList(logged.getId());
        if (list != null && list.size() != 0) {
            return gson.toJson(list);
        } else {
            return null;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/addGroup", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    public String add(@RequestParam String cid, @RequestParam String name) {
        String error = check(cid, name);
        if (error == null) {
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("u_id", cid);
            param.put("name", name);
            service.addGroup(param);
            error = "添加成功";
        }
        return "[\"" + error + "\"]";
    }

    @ResponseBody
    @RequestMapping(value = "/delGroup", method = RequestMethod.POST)
    public void delete(@RequestParam String id) {
        service.delGroup(id);
    }

    private String check(String cid, String name) {
        String error = null;
        if (!notEmpty(cid)) {
            error = "未知错误";
        } else if (!notEmpty(name)) {
            error = "名称不能为空";
        } else if (name.length() > 32) {
            error = "名称最大长度32位";
        }
        return error;
    }

}
