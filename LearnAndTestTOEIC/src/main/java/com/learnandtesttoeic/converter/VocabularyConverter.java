package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.VocabularyDTO;
import com.learnandtesttoeic.entity.VocabularyEntity;
import org.springframework.stereotype.Component;

@Component
public class VocabularyConverter {

    public VocabularyDTO toDTO(VocabularyEntity vocabularyEntity){
        VocabularyDTO vocabularyDTO = new VocabularyDTO();
        vocabularyDTO.setId(vocabularyEntity.getId());
        vocabularyDTO.setName(vocabularyEntity.getName());
        vocabularyDTO.setImage(vocabularyEntity.getImage());
        return vocabularyDTO;
    }

    public VocabularyEntity toEntity(VocabularyDTO vocabularyDTO){
        VocabularyEntity vocabularyEntity = new VocabularyEntity();
        if(vocabularyDTO.getId() != 0)
            vocabularyEntity.setId(vocabularyDTO.getId());
        vocabularyEntity.setName(vocabularyDTO.getName());
        vocabularyEntity.setImage(vocabularyDTO.getImage());
        return vocabularyEntity;
    }
}
