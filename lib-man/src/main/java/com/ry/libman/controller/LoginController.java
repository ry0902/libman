package com.ry.libman.controller;

import com.ry.libman.bean.Result;
import com.ry.libman.bean.User;
import com.ry.libman.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.HtmlUtils;


@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @CrossOrigin
    @ResponseBody
    @RequestMapping(value = "api/login", method = RequestMethod.POST)
    public Result login(@RequestBody User requestUser){
        String username = requestUser.getUsername();
        username = HtmlUtils.htmlEscape(username);

        User user = userService.get(username, requestUser.getPassword());
        if(user == null){
            return new Result(400);
        }
        else {
            return new Result(200);
        }

    }
}
