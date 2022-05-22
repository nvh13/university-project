package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.ExamQuestionDTO;
import com.learnandtesttoeic.entity.ExamEntity;
import com.learnandtesttoeic.entity.ExamQuestionEntity;
import com.learnandtesttoeic.repository.ExamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class ExamQuestionConverter {

    @Autowired
    ExamRepository examRepository;

    public ExamQuestionDTO toDTO(ExamQuestionEntity examQuestionEntity){
        ExamQuestionDTO examQuestionDTO = new ExamQuestionDTO();
        examQuestionDTO.setId(examQuestionEntity.getId());
        examQuestionDTO.setCorrectOption(examQuestionEntity.getCorrectOption());
        examQuestionDTO.setQuestion(examQuestionEntity.getQuestion());
        examQuestionDTO.setParagraph(examQuestionEntity.getParagraph());
        examQuestionDTO.setOption1(examQuestionEntity.getOption1());
        examQuestionDTO.setAudio(examQuestionEntity.getAudio());
        examQuestionDTO.setImage(examQuestionEntity.getImage());
        examQuestionDTO.setOption2(examQuestionEntity.getOption2());
        examQuestionDTO.setOption3(examQuestionEntity.getOption3());
        examQuestionDTO.setOption4(examQuestionEntity.getOption4());
        examQuestionDTO.setPart(examQuestionEntity.getPart());
        examQuestionDTO.setGroup(examQuestionEntity.getGroupQuestion());
        examQuestionDTO.setDescription(examQuestionEntity.getDescription());
        examQuestionDTO.setExamId(examQuestionEntity.getExam().getId());
        return examQuestionDTO;
    }

    public ExamQuestionEntity toEntity(ExamQuestionDTO examQuestionDTO){
        Optional<ExamEntity> optional = examRepository.findById(examQuestionDTO.getExamId());
        ExamQuestionEntity examQuestionEntity = new ExamQuestionEntity();
        if(examQuestionDTO.getId() !=0){
            examQuestionEntity.setId(examQuestionDTO.getId());
        }
        examQuestionEntity.setCorrectOption(examQuestionDTO.getCorrectOption());
        examQuestionEntity.setQuestion(examQuestionDTO.getQuestion());
        examQuestionEntity.setParagraph(examQuestionDTO.getParagraph());
        examQuestionEntity.setOption1(examQuestionDTO.getOption1());
        examQuestionEntity.setAudio(examQuestionDTO.getAudio());
        examQuestionEntity.setImage(examQuestionDTO.getImage());
        examQuestionEntity.setOption2(examQuestionDTO.getOption2());
        examQuestionEntity.setOption3(examQuestionDTO.getOption3());
        examQuestionEntity.setOption4(examQuestionDTO.getOption4());
        examQuestionEntity.setPart(examQuestionDTO.getPart());
        examQuestionEntity.setGroupQuestion(examQuestionDTO.getGroup());
        examQuestionEntity.setDescription(examQuestionDTO.getDescription());
        if(optional.isPresent()){
            examQuestionEntity.setExam(optional.get());
        }
        return examQuestionEntity;
    }
}
