package com.wx.controller;

import com.wx.entity.User;
import com.wx.service.OVService;
import com.wx.util.DateUtil;
import com.wx.util.ServletUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Admin/Code")
public class CodeController extends ServletUtils {

    @Autowired
    private OVService service;

    @RequestMapping(value = "/getCodeGroup")
    public ModelAndView select(HttpSession session) {
        User logged = (User) session.getAttribute("logged");
        ModelAndView view = new ModelAndView("/admin/code/list");
        List<Map<String, Object>> list = service.findCodeGroup(logged.getId());
        if (list != null && list.size() != 0) {
            view.addObject("list", list);
        } else {
            view.addObject("error", "无可用充值码！");
        }
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/addCode", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    public String add(HttpSession session, @RequestParam String pid, @RequestParam String remark,
                      @RequestParam Long num) {
        int isAdmin = 1;
        String error = null;
        String batch = null;
        remark = notEmpty(remark) ? remark : "";
        if (!notEmpty(pid))
            error = "未知错误";
        if (!notEmpty(error)) {
            User logged = (User) session.getAttribute("logged");
            isAdmin = Integer.parseInt(logged.getRole()) < 3 ? 0 : 1;
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("pid", pid);
            param.put("uid", logged.getId());
            Map<String, Long> info = service.findInfo(param);
            long s = info.get("money") - info.get("price") * num * isAdmin;
            if (s >= 0) {
                batch = DateUtil.getCodeTime();
                Set<Map<String, Object>> set = new HashSet<Map<String, Object>>();
                List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
                for (int i = 0; i < num; i++) {
                    Map<String, Object> code = new HashMap<String, Object>();
                    code.put("batch", batch);
                    code.put("code", randomStr());
                    code.put("u_id", logged.getId());
                    code.put("time", info.get("time"));
                    set.add(code);
                }
                param.clear();
                list.addAll(set);
                param.put("batch", batch);
                param.put("remark", remark);
                param.put("u_id", logged.getId());
                service.addCode_Info(param);
                service.addCode(list);
                if (isAdmin != 0) {
                    param.clear();
                    param.put("id", logged.getId());
                    param.put("money", info.get("money") - info.get("price") * list.size() * isAdmin);
                    service.userUpdate(param);
                }
                error = "成功购买" + list.size() + "个";
            } else {
                error = "亲，你的钱钱不够哟，先去找BOSS充个值吧";
            }
        }
        return "[\"" + error + "\",\"" + batch + "\"]";
    }

    private String randomStr() {
        String numbers = "1234567890";
        StringBuffer str = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < 8; i++) {
            int num = random.nextInt(10);
            str.append(numbers.charAt(num));
        }
        return str.toString();
    }

}
