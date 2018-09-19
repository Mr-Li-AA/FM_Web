package com.shaoshuai.web.controller;

import com.shaoshuai.domain.User;
import com.shaoshuai.service.CartService;
import com.shaoshuai.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController extends BaseController {

    @Autowired
    private UserService service;
    @Autowired
    private CartService cartService;

    //注册


    //登录
    @PostMapping("userlogin.do")
    public String login(String name, String password, HttpSession session,Model model){
        User user=service.login(name,password);
        if (user==null){
            model.addAttribute("msg","用户名错误");
            return "login.jsp";
        }else {
            session.setAttribute("user",user);
            session.setAttribute("cart",cartService.queryById(user.getId()));
            return "index.jsp";
        }
    }
}
