package com.learnandtesttoeic.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "exam_question")
@Data
public class ExamQuestionEntity extends BaseEntity{

    private String audio;

    private String correctOption;

    private int groupQuestion;

    private String image;

    private String option1;

    private String option2;

    private String option3;

    private String option4;

    private String paragraph;

    private String question;

    private String description;

    private int part;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "exam_id")
    @ToString.Exclude
    private ExamEntity exam;
}
