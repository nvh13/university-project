package com.learnandtesttoeic.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "ReadingControllerOfAdmin")
public class ReadingController {
    @GetMapping(value = "/admin/reading")
    public String getReading(){
        return "/admin/reading";
    }

    @GetMapping(value = "/admin/readingQuestion")
    public String getReadingQuestion(){
        return "/admin/readingQuestion/readingQuestion";
    }

    @GetMapping(value = "/admin/readingQuestion/created")
    public String createReadingQuestion(){
        return "/admin/readingQuestion/questionCreated";
    }

    @GetMapping(value = "/admin/readingQuestion/updated")
    public String updatedReadingQuestion(){
        return "/admin/readingQuestion/questionUpdated";
    }
}
