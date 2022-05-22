package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.converter.ExamQuestionConverter;
import com.learnandtesttoeic.dto.ExamQuestionDTO;
import com.learnandtesttoeic.entity.ExamQuestionEntity;
import com.learnandtesttoeic.repository.ExamQuestionRepository;
import com.learnandtesttoeic.service.IExamQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class ExamQuestionService implements IExamQuestionService {

    @Autowired
    ExamQuestionRepository examQuestionRepository;

    @Autowired
    ExamQuestionConverter examQuestionConverter;

    @Override
    public List<ExamQuestionDTO> findAllByExamId(Long examId, Pageable pageable) {
        List<ExamQuestionDTO> examQuestionDTOS = new ArrayList<>();
        examQuestionRepository.findAllByExamId(examId, pageable).stream().forEach(examEntity -> examQuestionDTOS.add(examQuestionConverter.toDTO(examEntity)));
        return examQuestionDTOS;
    }

    @Override
    public Long count(Long examId) {
        return examQuestionRepository.countByExamId(examId);
    }

    @Override
    public ExamQuestionDTO findById(Long id) {
        ExamQuestionDTO examQuestionDTO = new ExamQuestionDTO();
        Optional<ExamQuestionEntity> examQuestionEntity= examQuestionRepository.findById(id);
        if(examQuestionEntity.isPresent()){
            examQuestionDTO = examQuestionConverter.toDTO(examQuestionEntity.get());
        }
        return examQuestionDTO;
    }

    @Override
    public void saveExamQuestion(ExamQuestionDTO examQuestionDTO) {
        ExamQuestionEntity examQuestionEntity =  examQuestionConverter.toEntity(examQuestionDTO);
        examQuestionRepository.save(examQuestionEntity);
    }

    @Override
    public void delete(Long[] ids) {
        Arrays.stream(ids).forEach(id -> examQuestionRepository.deleteById(id));
    }

    @Override
    public List<ExamQuestionDTO> searching(String keyword, Long examId) {
        List<ExamQuestionDTO> examQuestionDTOS = new ArrayList<>();
        examQuestionRepository.search(keyword,examId).stream().forEach(examEntity -> examQuestionDTOS.add(examQuestionConverter.toDTO(examEntity)));
        return examQuestionDTOS;
    }

    @Override
    public List<ExamQuestionDTO> getListExamQuestion(Long examId, int index) {
        List<ExamQuestionDTO> examQuestionDTOS = new ArrayList<>();
        examQuestionRepository.findAllByExamIdAndGroupQuestion(examId, index).stream().forEach(examEntity -> examQuestionDTOS.add(examQuestionConverter.toDTO(examEntity)));
        return examQuestionDTOS;
    }

    @Override
    public List<ExamQuestionDTO> findAllByExamId(Long examId) {
        List<ExamQuestionDTO> examQuestionDTOS = new ArrayList<>();
        examQuestionRepository.findAllByExamId(examId).stream().forEach(examEntity -> examQuestionDTOS.add(examQuestionConverter.toDTO(examEntity)));
        return bubbleSort(examQuestionDTOS);
    }

    public List<ExamQuestionDTO> bubbleSort(List<ExamQuestionDTO> list){
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = 0; j < list.size() - i - 1; j++) {
                ExamQuestionDTO before = list.get(j);
                ExamQuestionDTO after = list.get(j + 1);
                if( before.getPart() > after.getPart()){
                    ExamQuestionDTO temp = before;
                    list.set(j, after);
                    list.set(j+1, temp);
                }
            }
        }
        return list;
    }
}
