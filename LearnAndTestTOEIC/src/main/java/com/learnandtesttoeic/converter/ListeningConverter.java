package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.ListeningDTO;
import com.learnandtesttoeic.entity.ListeningEntity;
import org.springframework.stereotype.Component;

@Component
public class ListeningConverter {
    public ListeningDTO toDTO(ListeningEntity listeningEntity){
        ListeningDTO listeningDTO = new ListeningDTO();
        listeningDTO.setId(listeningEntity.getId());
        listeningDTO.setName(listeningEntity.getName());
        listeningDTO.setLevel(listeningEntity.getLevel());
        listeningDTO.setPart(listeningEntity.getPart());
        listeningDTO.setImage(listeningEntity.getImage());
        listeningDTO.setDescription(listeningEntity.getDescription());
        return listeningDTO;
    }
}
