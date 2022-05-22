package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.ResultDTO;
import com.learnandtesttoeic.entity.ResultEntity;
import org.springframework.stereotype.Component;

@Component
public class ResultConverter {
    public ResultDTO toDTO(ResultEntity resultEntity){
        ResultDTO resultDTO = new ResultDTO();
        resultDTO.setId(resultEntity.getId());
        resultDTO.setListeningScore(resultEntity.getListeningScore());
        resultDTO.setReadingScore(resultEntity.getReadingScore());
        resultDTO.setNumberCorrect(resultEntity.getNumberCorrect());
        resultDTO.setExamName(resultEntity.getExam().getName());
        return resultDTO;
    }
}
