package com.learnandtesttoeic.dto;

import lombok.Data;

@Data
public class ReadingQuestionDTO {
    private long id;

    private String question;

    private String option1;

    private String option2;

    private String option3;

    private String option4;

    private String correctOption;

    private String paragraph;

    private String reason;

    private Long readingId;
}
