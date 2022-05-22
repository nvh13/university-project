package com.learnandtesttoeic.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "ListeningControllerOfAdmin")
public class ListeningController {

    @GetMapping(value = "/admin/listening")
    public String getListening(){
        return "/admin/listening";
    }

    @GetMapping(value = "/admin/listeningQuestion")
    public String getListeningQuestion(){
        return "/admin/listeningQuestion/listeningQuestion";
    }

    @GetMapping(value = "/admin/listeningQuestion/created")
    public String createListeningQuestion(){
        return "/admin/listeningQuestion/questionCreated";
    }

    @GetMapping(value = "/admin/listeningQuestion/updated")
    public String updatedListeningQuestion(){
        return "/admin/listeningQuestion/questionUpdated";
    }
}
