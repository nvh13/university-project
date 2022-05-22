package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.converter.VocabularyConverter;
import com.learnandtesttoeic.dto.VocabularyDTO;
import com.learnandtesttoeic.entity.VocabularyEntity;
import com.learnandtesttoeic.repository.VocabularyRepository;
import com.learnandtesttoeic.service.IVocabularyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class VocabularyService implements IVocabularyService {

    @Autowired
    VocabularyRepository vocabularyRepository;

    @Autowired
    VocabularyConverter vocabularyConverter;

    @Override
    public List<VocabularyDTO> findAll(Pageable pageable) {
        List<VocabularyDTO>  vocabularyDTOS = new ArrayList<>();
        vocabularyRepository.findAll(pageable).stream().forEach(vocabularyEntity -> vocabularyDTOS.add(vocabularyConverter.toDTO(vocabularyEntity)));
        return vocabularyDTOS;
    }

    @Override
    public void saveVocabulary(VocabularyDTO vocabularyDTO) {
        VocabularyEntity vocabularyEntity = vocabularyConverter.toEntity(vocabularyDTO);
        vocabularyRepository.save(vocabularyEntity);
    }

    @Override
    public VocabularyDTO findById(Long id) {
        VocabularyDTO vocabularyDTO = new VocabularyDTO();
        Optional<VocabularyEntity> vocabularyEntity= vocabularyRepository.findById(id);
        if(vocabularyEntity.isPresent()){
            vocabularyDTO = vocabularyConverter.toDTO(vocabularyEntity.get());
        }
        return vocabularyDTO;
    }

    @Override
    public Long count() {
        return vocabularyRepository.count();
    }

    @Override
    public void delete(Long id) {
        vocabularyRepository.deleteById(id);
    }
}
