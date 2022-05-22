package com.learnandtesttoeic.dto;

import lombok.Data;

@Data
public class ReadingDTO {

    private long id;

    private String name;

    private int level;

    private int part;

    private String description;

    private String image;
}
