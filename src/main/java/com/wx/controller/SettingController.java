package com.wx.controller;

import com.wx.entity.User;
import com.wx.service.OVService;
import com.wx.util.ServletUtils;
import com.wx.util.StringCode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Admin/Setting")
public class SettingController extends ServletUtils {

    @Autowired
    private OVService service;

    @ResponseBody
    @RequestMapping(value = "/{val}")
    public String update(HttpSession session, @PathVariable String val,
                         @RequestParam(value = "indexExplain", required = false) String indexExplain,
                         @RequestParam(value = "AppExplain", required = false) String AppExplain,
                         @RequestParam(value = "AppNotice", required = false) String AppNotice,
                         @RequestParam(value = "buyUrl", required = false) String buyUrl,
                         @RequestParam(value = "regDay", required = false) String regDay,
                         @RequestParam(value = "QQ", required = false) String QQ) {
        User user = (User) session.getAttribute("logged");
        Map<String, Object> param = new HashMap<String, Object>();
        switch (val) {
            case "indexExplain":
                if (!"1".equals(user.getRole()))
                    return "0";
                param.put("indexExplain", indexExplain);
                break;
            case "AppExplain":
                param.put("AppExplain", StringCode.getInstance().encrypt(AppExplain));
                break;
            case "AppNotice":
                param.put("AppNotice", StringCode.getInstance().encrypt(AppNotice));
                break;
            case "buyUrl":
                param.put("buyUrl", buyUrl);
                break;
            case "regDay":
                param.put("regDay", regDay);
                break;
            case "QQ":
                param.put("QQ", QQ);
                break;
        }
        param.put("u_id", user.getId());
        service.updateSetting(param);
        return "1";
    }
}
