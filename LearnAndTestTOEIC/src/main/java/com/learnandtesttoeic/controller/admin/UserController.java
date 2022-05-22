package com.learnandtesttoeic.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "userControllerOfAdmin")
public class UserController {
    @GetMapping(value = "/admin/user")
    public String getUsers(){
        return "/admin/user";
    }
    @GetMapping(value = "/admin/user/created")
    public String createdUser(){
        return "/admin/user/userCreated";
    }
    @GetMapping(value = "/admin/user/updated")
    public String updatedUser(){
        return "/admin/user/userUpdated";
    }
}
