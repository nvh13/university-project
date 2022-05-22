package com.learnandtesttoeic.service;

import com.learnandtesttoeic.dto.ReadingQuestionDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IReadingQuestionService {
    List<ReadingQuestionDTO> findAllByReadingId(Long readingId, Pageable pageable);
    Long count(Long readingId);
    void saveReadingQuestion(ReadingQuestionDTO readingQuestionDTO);
    void delete(Long[] ids);
    ReadingQuestionDTO findById(Long id);
    List<ReadingQuestionDTO> searching(String keyword, Long readingId);

    List<ReadingQuestionDTO> getListReadingQuestion(Long readingId, int index);

    int selectiveCounting(Long readingId);
}
