package com.learnandtesttoeic.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "vocabulary")
@Data
public class VocabularyEntity extends BaseEntity{

    private String name;

    private String image;

    @OneToMany(mappedBy = "vocabulary", cascade = CascadeType.REMOVE)
    private List<VocabularyDetailEntity> vocabularyDEs;
}
