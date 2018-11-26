package com.baizhi.ddm.controller;

import com.baizhi.ddm.entity.User;
import com.baizhi.ddm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(String email, String password, String kaptcha, HttpSession session) {
        //Map map = new HashMap<>();
        System.out.println(email + "==========" + password);
        User user = userService.login(email, password);
        System.out.println("user = " + user);
        String code = (String) session.getAttribute("kaptcha");
        System.out.println("code=" + code + "<=============>" + "kaptcha" + kaptcha);
        /*if(user != null && code.equals(kaptcha)){
            map.put("isLogin",true);
        }else {
            map.put("isLogin",false);
        }*/
        if (user != null && code.equals(kaptcha)) {
            System.out.println("登录成功！");
            return "redirect:/main/main.jsp";
        } else {
            System.out.println("登录失败！");
            return "redirect:/index.jsp";
        }
    }
}
