package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.GrammarDTO;
import com.learnandtesttoeic.entity.GrammarEntity;
import org.springframework.stereotype.Component;

@Component
public class GrammarConverter {

    public GrammarDTO toDTO(GrammarEntity grammarEntity){
        GrammarDTO grammarDTO = new GrammarDTO();
        grammarDTO.setId(grammarEntity.getId());
        grammarDTO.setName(grammarEntity.getName());
        grammarDTO.setShortDescription(grammarEntity.getShortDescription());
        grammarDTO.setImageInside(grammarEntity.getImageInside());
        grammarDTO.setContent(grammarEntity.getContent());
        grammarDTO.setImageOutside(grammarEntity.getImageOutside());
        return grammarDTO;
    }

    public GrammarEntity toEntity(GrammarDTO grammarDTO){
        GrammarEntity grammarEntity = new GrammarEntity();
        if(grammarDTO.getId() != 0){
            grammarEntity.setId(grammarDTO.getId());
        }
        grammarEntity.setName(grammarDTO.getName());
        grammarEntity.setShortDescription(grammarDTO.getShortDescription());
        grammarEntity.setImageInside(grammarDTO.getImageInside());
        grammarEntity.setContent(grammarDTO.getContent());
        grammarEntity.setImageOutside(grammarDTO.getImageOutside());
        return grammarEntity;
    }
}
