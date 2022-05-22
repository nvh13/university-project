package com.learnandtesttoeic.dto;

import lombok.Data;

@Data
public class GrammarDTO {
    private long id;

    private String name;

    private String shortDescription;

    private String imageOutside;

    private String imageInside;

    private String content;
}
