package com.wx.util;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BaseUtils {

    public boolean notEmptyMap(Map<String, Object> param) {
        if (param != null && param.size() != 0) {
            return true;
        }
        return false;
    }

    public boolean notEmptyList(List<String> param) {
        if (param != null && param.size() != 0) {
            return true;
        }
        return false;
    }

    public boolean notEmpty(String str) {
        if (str != null && str.length() != 0 && !str.isEmpty()) {
            return true;
        }
        return false;
    }

    public boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("[0-9\\.]+");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

    public double toSqlNumber(String str) {
        if (isNumeric(str)) {
            return Double.parseDouble(str) * 100;
        }
        return 0L;
    }

    public double fromSqlNumber(String str) {
        if (isNumeric(str)) {
            return Double.parseDouble(str) / 100;
        }
        return 0L;
    }
}
