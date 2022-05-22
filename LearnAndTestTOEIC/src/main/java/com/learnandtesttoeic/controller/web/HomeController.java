package com.learnandtesttoeic.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

    @GetMapping(value = {"/home", "/"})
    public String homePage(){
        return "web/home";
    }

    @GetMapping(value = {"/login"})
    public String login(){
        return "login";
    }

    @GetMapping(value = {"/register"})
    public String register(){
        return "register";
    }

    @GetMapping(value = {"/user"})
    public String userPage(){
        return "web/user";
    }

    @GetMapping(value = {"/accessDenied"})
    public String error(){
        return "403";
    }

    @GetMapping(value = {"/grammar"})
    public String grammarPage(){
        return "web/grammar";
    }

    @GetMapping(value = {"/vocabulary"})
    public String vocabularyPage(){
        return "web/vocabulary";
    }

    @GetMapping(value = {"/listening"})
    public String listeningPage(){
        return "web/listening";
    }

    @GetMapping(value = {"/reading"})
    public String readingPage(){
        return "web/reading";
    }

    @GetMapping(value = {"/exam"})
    public String examPage(){
        return "web/exam";
    }
}
