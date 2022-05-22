package com.learnandtesttoeic.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "listening_question")
@Data
public class ListeningQuestionEntity extends BaseEntity{

    private String question;

    private String image;

    private String audio;

    private String option1;

    private String option2;

    private String option3;

    private String option4;

    private String correctOption;

    @Column(columnDefinition = "TEXT")
    private String reason;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "listening_id")
    @ToString.Exclude
    private ListeningEntity listening;
}
