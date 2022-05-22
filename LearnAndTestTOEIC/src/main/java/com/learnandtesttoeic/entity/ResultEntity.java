package com.learnandtesttoeic.entity;

import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name="result")
@Data
public class ResultEntity extends BaseEntity{
    private int listeningScore;

    private int readingScore;

    private int numberCorrect;

    @Column(nullable = false, updatable = false)
    @CreationTimestamp
    private Timestamp testDay;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @ToString.Exclude
    private UserEntity user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "exam_id")
    @ToString.Exclude
    private ExamEntity exam;
}
