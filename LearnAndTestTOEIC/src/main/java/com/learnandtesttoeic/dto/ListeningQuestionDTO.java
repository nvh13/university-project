package com.learnandtesttoeic.dto;

import lombok.Data;

@Data
public class ListeningQuestionDTO{
    private long id;

    private String question;

    private String image;

    private String audio;

    private String option1;

    private String option2;

    private String option3;

    private String option4;

    private String correctOption;

    private String reason;

    private Long listeningId;
}
