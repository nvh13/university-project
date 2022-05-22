package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.ReadingQuestionDTO;
import com.learnandtesttoeic.entity.ReadingEntity;
import com.learnandtesttoeic.entity.ReadingQuestionEntity;
import com.learnandtesttoeic.repository.ReadingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class ReadingQuestionConverter {
    @Autowired
    ReadingRepository readingRepository;

    public ReadingQuestionDTO toDTO(ReadingQuestionEntity readingQuestionEntity){
        ReadingQuestionDTO readingQuestionDTO = new ReadingQuestionDTO();
        readingQuestionDTO.setId(readingQuestionEntity.getId());
        readingQuestionDTO.setQuestion(readingQuestionEntity.getQuestion());
        readingQuestionDTO.setOption1(readingQuestionEntity.getOption1());
        readingQuestionDTO.setOption2(readingQuestionEntity.getOption2());
        readingQuestionDTO.setOption3(readingQuestionEntity.getOption3());
        readingQuestionDTO.setOption4(readingQuestionEntity.getOption4());
        readingQuestionDTO.setCorrectOption(readingQuestionEntity.getCorrectOption());
        readingQuestionDTO.setParagraph(readingQuestionEntity.getParagraph());
        readingQuestionDTO.setReason(readingQuestionEntity.getReason());
        readingQuestionDTO.setReadingId(readingQuestionEntity.getReading().getId());
        return readingQuestionDTO;
    }

    public ReadingQuestionEntity toEntity(ReadingQuestionDTO readingQuestionDTO){
        Optional<ReadingEntity> optional = readingRepository.findById(readingQuestionDTO.getReadingId());
        ReadingQuestionEntity readingQuestionEntity = new ReadingQuestionEntity();
        if(readingQuestionDTO.getId() != 0){
            readingQuestionEntity.setId(readingQuestionDTO.getId());
        }
        readingQuestionEntity.setQuestion(readingQuestionDTO.getQuestion());
        readingQuestionEntity.setOption1(readingQuestionDTO.getOption1());
        readingQuestionEntity.setOption2(readingQuestionDTO.getOption2());
        readingQuestionEntity.setOption3(readingQuestionDTO.getOption3());
        readingQuestionEntity.setOption4(readingQuestionDTO.getOption4());
        readingQuestionEntity.setCorrectOption(readingQuestionDTO.getCorrectOption());
        readingQuestionEntity.setReason(readingQuestionDTO.getReason());
        readingQuestionEntity.setParagraph(readingQuestionDTO.getParagraph());
        if(optional.isPresent()){
            readingQuestionEntity.setReading(optional.get());
        }
        return readingQuestionEntity;
    }
}
