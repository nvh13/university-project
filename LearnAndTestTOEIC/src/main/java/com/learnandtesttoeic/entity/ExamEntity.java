package com.learnandtesttoeic.entity;

import lombok.Data;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "exam")
@Data
public class ExamEntity extends BaseEntity{

    private String name;

    private String image;

    @OneToMany(mappedBy = "exam", cascade = CascadeType.REMOVE)
    private List<ExamQuestionEntity> examQuestionEntities;

    @OneToMany(mappedBy = "exam", cascade = CascadeType.REMOVE)
    private List<ResultEntity> resultEntities;
}
