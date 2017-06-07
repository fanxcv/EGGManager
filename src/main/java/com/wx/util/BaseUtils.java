package com.wx.util;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BaseUtils {

    protected boolean notEmptyMap(Map<String, Object> param) {
        return param != null && param.size() != 0;
    }

    protected boolean notEmptyList(List<String> param) {
        return param != null && param.size() != 0;
    }

    public boolean notEmpty(String str) {
        return str != null && str.length() != 0 && !str.isEmpty();
    }

    protected boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("[0-9\\.]+");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

    protected double toSqlNumber(String str) {
        if (isNumeric(str)) {
            return Double.parseDouble(str) * 100;
        }
        return 0L;
    }

    protected double fromSqlNumber(String str) {
        if (isNumeric(str)) {
            return Double.parseDouble(str) / 100;
        }
        return 0L;
    }
}
