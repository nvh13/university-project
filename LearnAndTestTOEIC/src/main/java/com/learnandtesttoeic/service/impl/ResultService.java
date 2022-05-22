package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.dto.ResultDTO;
import com.learnandtesttoeic.entity.ExamEntity;
import com.learnandtesttoeic.entity.ExamQuestionEntity;
import com.learnandtesttoeic.entity.ResultEntity;
import com.learnandtesttoeic.repository.ExamRepository;
import com.learnandtesttoeic.repository.ResultRepository;
import com.learnandtesttoeic.repository.UserRepository;
import com.learnandtesttoeic.service.IResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ResultService implements IResultService {

    @Autowired
    ResultRepository resultRepository;

    @Autowired
    ExamRepository examRepository;

    @Autowired
    UserRepository userRepository;

    @Override
    public ResultDTO scored (Map<Long, String> answers, Long examId, String userName) {
        int numberCorrect;
        int numberListening = 0;
        int numberReading = 0;
        List<Integer> indexTrue = new ArrayList<>();
        List<Integer> indexFalse = new ArrayList<>();
        Optional<ExamEntity> optional= examRepository.findById(examId);
        ExamEntity examEntity = new ExamEntity();
        if(optional.isPresent()){
            examEntity = optional.get();
        }
        List<ExamQuestionEntity> examQuestionEntities = examEntity.getExamQuestionEntities();
        ResultEntity resultEntity = new ResultEntity();
        for (Map.Entry<Long, String> answer: answers.entrySet()) {
            ExamQuestionEntity examQuestionEntity = getById(examQuestionEntities, answer.getKey());
            if(examQuestionEntity.getCorrectOption().equals(answer.getValue())){
                indexTrue.add(examQuestionEntities.indexOf(examQuestionEntity));
                if(examQuestionEntity.getPart() <= 4){
                    numberListening ++;
                }
                else{
                    numberReading ++;
                }
            }else{
                indexFalse.add(examQuestionEntities.indexOf(examQuestionEntity));
            }
        }
        numberCorrect = numberListening + numberReading;
        int listeningScore = numberListening * 5 < 500 ? numberListening * 5 : 495;
        int readingScore = numberReading * 5 < 500 ? numberReading * 5 : 495;
        resultEntity.setNumberCorrect(numberCorrect);
        resultEntity.setExam(examEntity);
        resultEntity.setListeningScore(listeningScore);
        resultEntity.setReadingScore(readingScore);
        resultEntity.setUser(userRepository.findByUserName(userName));
        resultRepository.save(resultEntity);

        ResultDTO resultDTO = new ResultDTO();
        resultDTO.setNumberCorrect(numberCorrect);
        resultDTO.setListeningScore(listeningScore);
        resultDTO.setReadingScore(readingScore);
        resultDTO.setIndexTrue(indexTrue);
        resultDTO.setIndexFalse(indexFalse);
        return resultDTO;
    }

    public ExamQuestionEntity getById(List<ExamQuestionEntity> examQuestionEntities, Long id){

        ExamQuestionEntity examQuestionEntity = new ExamQuestionEntity();
        for (ExamQuestionEntity examQuestion: examQuestionEntities) {
            if(examQuestion.getId() == id){
                examQuestionEntity = examQuestion;
            }
        }
        return examQuestionEntity;
    }
}
