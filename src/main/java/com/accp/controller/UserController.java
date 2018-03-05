package com.accp.controller;

import com.accp.biz.UserBiz;
import com.accp.entity.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserBiz userBiz;

    /**
     * 跳转登录页面
     * @return
     */
    @RequestMapping("/login.to")
    public String toLogin(){
        return "login/login";
    }

    /**
     * 用户登录
     * @param users
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/login.do")
    public String doLogin(Users users, HttpSession session, Model model){
        Users user = userBiz.login(users);
        if(user!=null){
            session.setAttribute("userSession",user);
            return "main/main";
        }
        model.addAttribute("error","用户名或密码错误");
        return "login/login";
    }


}
