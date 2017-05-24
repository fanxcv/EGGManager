package com.wx.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static String getNowTime() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    public static String getCodeTime() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        return sdf.format(date);
    }
}
