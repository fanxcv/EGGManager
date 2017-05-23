package com.wx.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wx.util.StringCode;

@Controller
@RequestMapping("/PublicApi")
public class PublicApiController {

	@ResponseBody
	@RequestMapping(value = "/getGrant", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8;" })
	public String getGrant(@RequestParam String val) {
		return StringCode.getInstance().encrypt(StringCode.getInstance().decrypt(val) + "EGG");
	}
}
