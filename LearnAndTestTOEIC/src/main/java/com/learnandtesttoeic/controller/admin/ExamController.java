package com.learnandtesttoeic.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "ExamControllerOfAdmin")
public class ExamController {

    @GetMapping(value = "/admin/exam")
    public String getExam(){
        return "/admin/exam";
    }

    @GetMapping(value = "/admin/examQuestion")
    public String getExamQuestion(){
        return "/admin/examQuestion/examQuestion";
    }

    @GetMapping(value = "/admin/examQuestion/created")
    public String createExamQuestion(){
        return "/admin/examQuestion/examCreated";
    }

    @GetMapping(value = "/admin/examQuestion/updated")
    public String updatedExamQuestion(){
        return "/admin/examQuestion/examUpdated";
    }

    @GetMapping(value = "/admin/exam/created")
    public String createExam(){
        return "/admin/exam/examCreated";
    }

    @GetMapping(value = "/admin/exam/updated")
    public String updatedExam(){
        return "/admin/exam/examUpdated";
    }
}
