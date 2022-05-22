package com.learnandtesttoeic.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "reading")
@Data
public class ReadingEntity extends BaseEntity{

	private String name;

	private int level;

	private int part;

	private String description;

	private String image;

	@OneToMany(mappedBy = "reading")
	private List<ReadingQuestionEntity> readingQEs;

}
