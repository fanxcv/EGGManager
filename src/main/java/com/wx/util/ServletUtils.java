package com.wx.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class ServletUtils extends BaseUtils {

	protected static Gson gson = new Gson();

	protected void download(HttpServletResponse response, String context, String filename) {
		// File file = new File(filePath);
		if (notEmpty(context)) {
			filename = notEmpty(filename) ? filename : "code.txt";
			try (InputStream fis = new ByteArrayInputStream(context.getBytes());
					ServletOutputStream out = response.getOutputStream();) {
				byte[] b = new byte[fis.available()];
				fis.read(b);
				response.reset();
				response.setContentType("application/x-msdownload");
				response.setHeader("Content-Disposition", "attachment; filename=" + filename);
				response.setContentLength(b.length);
				out.write(b);
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	protected String getNowTime() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}

	protected Date strToDate(String str) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(str);
		} catch (ParseException e) {
			return null;
		}
	}

	protected String dateToStr(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}

	protected String DateDown(Date firstDate, Date lastDate) {
		double d = ((double) firstDate.getTime() - lastDate.getTime()) / 86400000;
		return new DecimalFormat("0.00").format(d < 0 ? 0 : d);
	}

	protected boolean isAfterNow(String date) {
		if (strToDate(date).getTime() > (new Date()).getTime())
			return true;
		return false;
	}

	protected String upTime(Date date, long days) {
		return dateToStr(new Date(date.getTime() + days * 24 * 60 * 60 * 1000));
	}
}
