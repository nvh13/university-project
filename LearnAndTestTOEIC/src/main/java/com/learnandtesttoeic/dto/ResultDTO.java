package com.learnandtesttoeic.dto;

import lombok.Data;

import java.util.List;

@Data
public class ResultDTO {
    private Long id;

    private int listeningScore;

    private int readingScore;

    private int numberCorrect;

    private List<Integer> indexTrue;
    private List<Integer> indexFalse;

    private String examName;

}
