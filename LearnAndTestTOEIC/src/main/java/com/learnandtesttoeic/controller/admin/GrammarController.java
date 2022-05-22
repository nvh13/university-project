package com.learnandtesttoeic.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "GrammarControllerOfAdmin")
public class GrammarController {
    @GetMapping(value = "/admin/grammar")
    public String getGrammar(){
        return "/admin/grammar";
    }

    @GetMapping(value = "/admin/grammarDetail")
    public String getGrammarDetail(){
        return "/admin/grammarDetail/grammar";
    }

    @GetMapping(value = "/admin/grammarDetail/created")
    public String createGrammar(){
        return "/admin/grammarDetail/questionCreated";
    }

    @GetMapping(value = "/admin/grammarDetail/updated")
    public String updatedGrammar(){
        return "/admin/grammarDetail/questionUpdated";
    }
}
