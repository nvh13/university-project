package com.learnandtesttoeic.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "vocabulary_detail")
@Data
public class VocabularyDetailEntity extends BaseEntity{

    private String name;

    private String spelling;

    private String wordType;

    private String example;

    private String audio;

    private String image;

    private String meaning;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vocabulary_id")
    @ToString.Exclude
    private VocabularyEntity vocabulary;
}
