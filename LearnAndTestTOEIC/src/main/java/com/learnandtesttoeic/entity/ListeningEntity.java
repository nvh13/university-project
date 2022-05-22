package com.learnandtesttoeic.entity;

import lombok.Data;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "listening")
@Data
public class ListeningEntity extends BaseEntity{

	private String name;

	private int level;

	private int part;

	private String description;

	private String image;

	@OneToMany(mappedBy = "listening")
	private List<ListeningQuestionEntity> listeningQEs;


}
