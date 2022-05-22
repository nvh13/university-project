package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.ReadingDTO;
import com.learnandtesttoeic.entity.ReadingEntity;
import org.springframework.stereotype.Component;

@Component
public class ReadingConverter {

    public ReadingDTO toDTO(ReadingEntity readingEntity){
        ReadingDTO readingDTO = new ReadingDTO();
        readingDTO.setId(readingEntity.getId());
        readingDTO.setName(readingEntity.getName());
        readingDTO.setLevel(readingEntity.getLevel());
        readingDTO.setPart(readingEntity.getPart());
        readingDTO.setDescription(readingEntity.getDescription());
        readingDTO.setImage(readingEntity.getImage());
        return readingDTO;
    }
}
