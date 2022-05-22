package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.converter.VocabularyDetailConverter;
import com.learnandtesttoeic.dto.VocabularyDetailDTO;
import com.learnandtesttoeic.entity.VocabularyDetailEntity;
import com.learnandtesttoeic.repository.VocabularyDetailRepository;
import com.learnandtesttoeic.service.IVocabularyDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class VocabularyDetailService implements IVocabularyDetailService {

    @Autowired
    VocabularyDetailRepository vocabularyDetailRepository;

    @Autowired
    VocabularyDetailConverter vocabularyDetailConverter;

    @Override
    public List<VocabularyDetailDTO> findAllByVocabularyId(Long vocabularyId, Pageable pageable) {
        List<VocabularyDetailDTO> vocabularyDetailDTOS = new ArrayList<>();
        vocabularyDetailRepository.findAllByVocabularyId(vocabularyId, pageable).stream().forEach(vocabularyEntity -> vocabularyDetailDTOS.add(vocabularyDetailConverter.toDTO(vocabularyEntity)));
        return vocabularyDetailDTOS;
    }

    @Override
    public Long count(Long vocabularyId) {
        return vocabularyDetailRepository.countByVocabularyId(vocabularyId);
    }

    @Override
    public VocabularyDetailDTO findById(Long id) {
        VocabularyDetailDTO vocabularyDetailDTO = new VocabularyDetailDTO();
        Optional<VocabularyDetailEntity> vocabularyDetailEntity= vocabularyDetailRepository.findById(id);
        if(vocabularyDetailEntity.isPresent()){
            vocabularyDetailDTO = vocabularyDetailConverter.toDTO(vocabularyDetailEntity.get());
        }
        return vocabularyDetailDTO;
    }

    @Override
    public void saveVocabularyDetail(VocabularyDetailDTO vocabularyDetailDTO) {
        VocabularyDetailEntity vocabularyDetailEntity =  vocabularyDetailConverter.toEntity(vocabularyDetailDTO);
        vocabularyDetailRepository.save(vocabularyDetailEntity);
    }

    @Override
    public void delete(Long[] ids) {
        Arrays.stream(ids).forEach(id -> vocabularyDetailRepository.deleteById(id));
    }

    @Override
    public List<VocabularyDetailDTO> searching(String keyword, Long vocabularyId) {
        List<VocabularyDetailDTO> vocabularyDetailDTOS = new ArrayList<>();
        vocabularyDetailRepository.search(keyword,vocabularyId).stream().forEach(vocabularyEntity -> vocabularyDetailDTOS.add(vocabularyDetailConverter.toDTO(vocabularyEntity)));
        return vocabularyDetailDTOS;
    }
}
