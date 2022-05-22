package com.learnandtesttoeic.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "VocabularyControllerOfAdmin")
public class VocabularyController {

    @GetMapping(value = "/admin/vocabulary")
    public String getVocabulary(){
        return "/admin/vocabulary";
    }

    @GetMapping(value = "/admin/vocabularyDetail")
    public String getVocabularyDetail(){
        return "/admin/vocabularyDetail/vocabularyDetail";
    }

    @GetMapping(value = "/admin/vocabularyDetail/created")
    public String createVocabularyDetail(){
        return "/admin/vocabularyDetail/vocabularyCreated";
    }

    @GetMapping(value = "/admin/vocabularyDetail/updated")
    public String updatedVocabularyDetail(){
        return "/admin/vocabularyDetail/vocabularyUpdated";
    }

    @GetMapping(value = "/admin/vocabulary/created")
    public String createVocabulary(){
        return "/admin/vocabulary/vocabularyCreated";
    }

    @GetMapping(value = "/admin/vocabulary/updated")
    public String updatedVocabulary(){
        return "/admin/vocabulary/vocabularyUpdated";
    }
}
