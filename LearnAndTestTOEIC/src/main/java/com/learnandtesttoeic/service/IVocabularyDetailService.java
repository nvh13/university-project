package com.learnandtesttoeic.service;
import com.learnandtesttoeic.dto.VocabularyDetailDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IVocabularyDetailService {
    List<VocabularyDetailDTO> findAllByVocabularyId(Long vocabularyId, Pageable pageable);
    Long count(Long vocabularyId);
    void saveVocabularyDetail(VocabularyDetailDTO vocabularyDetailDTO);
    void delete(Long[] ids);
    VocabularyDetailDTO findById(Long id);
    List<VocabularyDetailDTO> searching(String keyword, Long vocabularyDetailId);
}
