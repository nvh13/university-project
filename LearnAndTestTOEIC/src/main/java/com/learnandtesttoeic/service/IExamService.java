package com.learnandtesttoeic.service;
import com.learnandtesttoeic.dto.ExamDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IExamService {
    List<ExamDTO> findAll(Pageable pageable);

    void saveExam(ExamDTO examDTO);

    ExamDTO findById(Long id);

    Long count();

    void delete(Long id);
}
