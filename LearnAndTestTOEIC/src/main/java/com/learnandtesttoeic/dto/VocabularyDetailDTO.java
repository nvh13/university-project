package com.learnandtesttoeic.dto;

import lombok.Data;

@Data
public class VocabularyDetailDTO {

    private long id;

    private String name;

    private String spelling;

    private String wordType;

    private String example;

    private String audio;

    private String image;

    private String meaning;

    private Long vocabularyId;
}
