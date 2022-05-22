package com.learnandtesttoeic.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "grammar")
@Data
public class GrammarEntity extends BaseEntity{

    private String name;

    private String shortDescription;

    private String imageOutside;

    private String imageInside;

    @Column(columnDefinition = "TEXT")
    private String content;
}
