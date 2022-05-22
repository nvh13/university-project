package com.learnandtesttoeic.service;
import com.learnandtesttoeic.dto.ExamQuestionDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IExamQuestionService {
    List<ExamQuestionDTO> findAllByExamId(Long examId, Pageable pageable);

    List<ExamQuestionDTO> findAllByExamId(Long examId);
    Long count(Long examId);
    void saveExamQuestion(ExamQuestionDTO examQuestionDTO);
    void delete(Long[] ids);
    ExamQuestionDTO findById(Long id);
    List<ExamQuestionDTO> searching(String keyword, Long examId);

    List<ExamQuestionDTO> getListExamQuestion(Long examId, int index);
}
