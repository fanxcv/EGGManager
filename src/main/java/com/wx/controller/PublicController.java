package com.wx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PublicController {

    @RequestMapping(value = {"/", "/index"})
    public ModelAndView index() {
        return new ModelAndView("redirect:/LoginCtrl/index.do");
    }

    @RequestMapping(value = {"/login", "/login.*"})
    public String login() {
        return "login";
    }

    @RequestMapping(value = {"/register", "/register.*"})
    public String register() {
        return "register";
    }

    @RequestMapping("/error/{page}")
    public String toError(@PathVariable String page) {
        return "error/" + page;
    }

    @RequestMapping("/admin/{parent}/{page}")
    public String toAdmin(@PathVariable String parent, @PathVariable String page) {
        return "admin/" + parent + "/" + page;
    }

    // @RequestMapping("/admin/line/{page}")
    // public String toAdminLine(@PathVariable String page) {
    // return "admin/line/" + page;
    // }

    @RequestMapping("/{page}.html")
    public String toPage(@PathVariable String page) {
        return "forward:/static/" + page + ".html";
    }
}
