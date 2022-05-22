package com.learnandtesttoeic.service;
import com.learnandtesttoeic.dto.VocabularyDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IVocabularyService {
    List<VocabularyDTO> findAll(Pageable pageable);

    void saveVocabulary(VocabularyDTO vocabularyDTO);

    VocabularyDTO findById(Long id);

    Long count();

    void delete(Long id);
}
