package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.VocabularyDetailDTO;
import com.learnandtesttoeic.entity.VocabularyDetailEntity;
import com.learnandtesttoeic.entity.VocabularyEntity;
import com.learnandtesttoeic.repository.VocabularyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class VocabularyDetailConverter {

    @Autowired
    VocabularyRepository vocabularyRepository;

    public VocabularyDetailDTO toDTO(VocabularyDetailEntity vocabularyDetailEntity){
        VocabularyDetailDTO vocabularyDetailDTO = new VocabularyDetailDTO();
        vocabularyDetailDTO.setId(vocabularyDetailEntity.getId());
        vocabularyDetailDTO.setName(vocabularyDetailEntity.getName());
        vocabularyDetailDTO.setSpelling(vocabularyDetailEntity.getSpelling());
        vocabularyDetailDTO.setWordType(vocabularyDetailEntity.getWordType());
        vocabularyDetailDTO.setExample(vocabularyDetailEntity.getExample());
        vocabularyDetailDTO.setAudio(vocabularyDetailEntity.getAudio());
        vocabularyDetailDTO.setImage(vocabularyDetailEntity.getImage());
        vocabularyDetailDTO.setMeaning(vocabularyDetailEntity.getMeaning());
        vocabularyDetailDTO.setVocabularyId(vocabularyDetailEntity.getVocabulary().getId());
        return vocabularyDetailDTO;
    }

    public VocabularyDetailEntity toEntity(VocabularyDetailDTO vocabularyDetailDTO){
        Optional<VocabularyEntity> optional = vocabularyRepository.findById(vocabularyDetailDTO.getVocabularyId());
        VocabularyDetailEntity vocabularyDetailEntity = new VocabularyDetailEntity();
        if(vocabularyDetailDTO.getId() !=0){
            vocabularyDetailEntity.setId(vocabularyDetailDTO.getId());
        }
        vocabularyDetailEntity.setName(vocabularyDetailDTO.getName());
        vocabularyDetailEntity.setSpelling(vocabularyDetailDTO.getSpelling());
        vocabularyDetailEntity.setWordType(vocabularyDetailDTO.getWordType());
        vocabularyDetailEntity.setExample(vocabularyDetailDTO.getExample());
        vocabularyDetailEntity.setAudio(vocabularyDetailDTO.getAudio());
        vocabularyDetailEntity.setImage(vocabularyDetailDTO.getImage());
        vocabularyDetailEntity.setMeaning(vocabularyDetailDTO.getMeaning());
        if(optional.isPresent()){
            vocabularyDetailEntity.setVocabulary(optional.get());
        }
        return vocabularyDetailEntity;
    }
}
