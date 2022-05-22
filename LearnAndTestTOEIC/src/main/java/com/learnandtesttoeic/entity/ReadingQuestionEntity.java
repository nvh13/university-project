package com.learnandtesttoeic.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "reading_question")
@Data
public class ReadingQuestionEntity extends BaseEntity{

    private String question;

    private String option1;

    private String option2;

    private String option3;

    private String option4;

    private String correctOption;

    @Column(columnDefinition = "TEXT")
    private String paragraph;

    @Column(columnDefinition = "TEXT")
    private String reason;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reading_id")
    @ToString.Exclude
    private ReadingEntity reading;
}
