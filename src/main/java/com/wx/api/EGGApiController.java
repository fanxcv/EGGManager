package com.wx.api;

import com.wx.service.ApiService;
import com.wx.util.ServletUtils;
import com.wx.util.StringCode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/EGGApi")
public class EGGApiController extends ServletUtils {

    @Autowired
    ApiService service;

    @ResponseBody
    @RequestMapping(value = "/checkVal", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    public String checkVal(@RequestParam String val) {
        try {
            return StringCode.getInstance().encrypt(StringCode.getInstance().decrypt(val) + "EGG");
        } catch (Exception e) {
            return "亲，你乱请求个啥？";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getVersion", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    public String getVersion(@RequestParam String version) {
        try {
            float val = Float.parseFloat(StringCode.getInstance().decrypt(version));
            float lastVersion = service.findVersionByName("egg");
            if (lastVersion <= val) {
                return "1";
            }
            return "0";
        } catch (Exception e) {
            return "亲，你乱请求个啥？";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getWebInfo", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    public String getWebInfo(@RequestParam String name, @RequestParam String pass, @RequestParam String key,
                             @RequestParam(value = "remark", required = false) String remark) {
        try {
            Map<String, String> list = new HashMap<>();
            // 获取管理员信息
            Map<String, Object> admin = service.getAdminInfo(StringCode.getInstance().decrypt(key));
            if (notEmptyMap(admin)) {
                list.put("admin", gson.toJson(admin));
                // 获取app相关信息
                Map<String, Object> app = service.getAppInfo(admin.get("id") + "");
                if (notEmptyMap(app))
                    list.put("app", gson.toJson(app));
                // 获取对应用户信息
                Map<String, Object> param = new HashMap<>();
                param.put("u_id", admin.get("id"));
                param.put("name", StringCode.getInstance().decrypt(name));
                param.put("pass", StringCode.getInstance().decrypt(pass));
                param.put("remark", StringCode.getInstance().decrypt(remark));
                String dataTime = getNowTime();
                Map<String, String> user = service.getUserInfo(param);
                if (user != null && user.size() != 0) {
                    if (user.get("u_u_id") != null && user.get("u_u_id").equals(param.get("u_id") + "")) {
                        String time = null;
                        Map<String, Object> paramUp = new HashMap<>();
                        paramUp.put("lastLoginTime", dataTime);
                        paramUp.put("id", user.get("id"));
                        if (!notEmpty(user.get("active_time"))) {
                            paramUp.put("active_time", dataTime);
                            time = "0";
                        }
                        if (!notEmpty(user.get("due_time"))) {
                            paramUp.put("due_time", dataTime);
                            time = "0";
                        }
                        if (!"0".equals(time)) {
                            time = DateDown(strToDate(user.get("due_time")), new Date());
                        }
                        user.put("time", time);
                        service.userUpdate(paramUp);
                    } else {
                        user.put("time", "timeError");
                    }
                    list.put("user", gson.toJson(user));
                } else {
                    long initDay = service.findRegDay(admin.get("id") + "");
                    if (initDay > 0)
                        param.put("due_time", upTime(new Date(), initDay));
                    else
                        param.put("due_time", dataTime);
                    param.put("lastLoginTime", dataTime);
                    param.put("active_time", dataTime);
                    service.userAdd(param);
                    param.put("time", "0");
                    list.put("user", gson.toJson(param));
                }
            }
            return StringCode.getInstance().encrypt(gson.toJson(list));
        } catch (Exception e) {
            // e.printStackTrace();
            return "亲，你乱请求个啥？";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getLineList", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    public String getLineList(@RequestParam String id) {
        try {
            String val = StringCode.getInstance().decrypt(id);
            Map<String, Object> info = service.getUId(val);
            val = (Integer) info.get("role") < 3 ? val : (info.get("u_u_id") + "");
            List<Map<String, String>> list = service.findLineList(val);
            if (list != null && list.size() != 0)
                return StringCode.getInstance().encrypt(gson.toJson(list));
            return null;
        } catch (Exception e) {
            return "亲，你乱请求个啥？";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getLine", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    public String getLine(@RequestParam String id) {
        try {
            String val = StringCode.getInstance().decrypt(id);
            Map<String, String> line = service.findLine(val);
            if (line != null && line.size() != 0)
                return StringCode.getInstance().encrypt(gson.toJson(line));
            return null;
        } catch (Exception e) {
            return "亲，你乱请求个啥？";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/setCodeValue", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8;"})
    public String setCodeValue(@RequestParam String id, @RequestParam String code, @RequestParam String name,
                               @RequestParam String type) {
        try {
            Map<String, Object> param = new HashMap<>();
            param.put("u_id", StringCode.getInstance().decrypt(id));
            param.put("code", StringCode.getInstance().decrypt(code));
            param.put("name", StringCode.getInstance().decrypt(name));
            int days = service.findCodeTime(param);
            if (days > 0) {
                Map<String, String> user = service.getUserInfo(param);
                if (user != null && user.size() != 0) {
                    if ("1".equals(StringCode.getInstance().decrypt(type))) {
                        param.put("u_u_id", param.get("u_id"));
                    }
                    param.put("id", user.get("id"));
                    if (isAfterNow(user.get("due_time"))) {
                        param.put("due_time", upTime(strToDate(user.get("due_time")), days));
                    } else {
                        param.put("due_time", upTime(new Date(), days));
                    }
                    service.userUpdate(param);
                    service.delCode(param);
                    Map<String, String> result = new HashMap<>();
                    result.put("due_time", (String) param.get("due_time"));
                    result.put("time", DateDown(strToDate(result.get("due_time")), new Date()));
                    return StringCode.getInstance().encrypt(gson.toJson(result));
                }
            }
            return null;
        } catch (Exception e) {
            return "亲，你乱请求个啥？";
        }
    }
}
