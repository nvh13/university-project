package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.ExamDTO;
import com.learnandtesttoeic.entity.ExamEntity;
import org.springframework.stereotype.Component;

@Component
public class ExamConverter {

    public ExamDTO toDTO(ExamEntity examEntity){
        ExamDTO examDTO = new ExamDTO();
        examDTO.setId(examEntity.getId());
        examDTO.setName(examEntity.getName());
        examDTO.setImage(examEntity.getImage());
        return examDTO;
    }

    public ExamEntity toEntity(ExamDTO examDTO){
        ExamEntity examEntity = new ExamEntity();
        if(examDTO.getId() != 0)
            examEntity.setId(examDTO.getId());
        examEntity.setName(examDTO.getName());
        examEntity.setImage(examDTO.getImage());
        return examEntity;
    }
}
