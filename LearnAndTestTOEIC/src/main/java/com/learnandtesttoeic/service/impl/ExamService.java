package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.converter.ExamConverter;
import com.learnandtesttoeic.dto.ExamDTO;
import com.learnandtesttoeic.entity.ExamEntity;
import com.learnandtesttoeic.repository.ExamRepository;
import com.learnandtesttoeic.service.IExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ExamService implements IExamService {

    @Autowired
    ExamRepository examRepository;

    @Autowired
    ExamConverter examConverter;

    @Override
    public List<ExamDTO> findAll(Pageable pageable) {
        List<ExamDTO> examDTOS = new ArrayList<>();
        examRepository.findAll(pageable).stream().forEach(examEntity -> examDTOS.add(examConverter.toDTO(examEntity)));
        return examDTOS;
    }

    @Override
    public void saveExam(ExamDTO examDTO) {
        ExamEntity examEntity = examConverter.toEntity(examDTO);
        examRepository.save(examEntity);
    }

    @Override
    public ExamDTO findById(Long id) {
        ExamDTO examDTO = new ExamDTO();
        Optional<ExamEntity> examEntity= examRepository.findById(id);
        if(examEntity.isPresent()){
            examDTO = examConverter.toDTO(examEntity.get());
        }
        return examDTO;
    }

    @Override
    public Long count() {
        return examRepository.count();
    }

    @Override
    public void delete(Long id) {
        examRepository.deleteById(id);
    }
}
