package com.learnandtesttoeic.dto;

import lombok.Data;

@Data
public class ExamQuestionDTO {

    private long id;

    private String audio;

    private String correctOption;

    private String image;

    private String option1;

    private String option2;

    private String option3;

    private String option4;

    private String paragraph;

    private String question;

    private int part;

    private int group;

    private String description;

    private Long examId;
}
