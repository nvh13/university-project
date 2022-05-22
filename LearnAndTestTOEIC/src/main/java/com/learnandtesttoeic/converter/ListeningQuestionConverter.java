package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.ListeningQuestionDTO;
import com.learnandtesttoeic.entity.ListeningEntity;
import com.learnandtesttoeic.entity.ListeningQuestionEntity;
import com.learnandtesttoeic.repository.ListeningRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class ListeningQuestionConverter {

    @Autowired
    ListeningRepository listeningRepository;

    public ListeningQuestionDTO toDTO(ListeningQuestionEntity listeningQuestionEntity){
        ListeningQuestionDTO listeningQuestionDTO = new ListeningQuestionDTO();
        listeningQuestionDTO.setId(listeningQuestionEntity.getId());
        listeningQuestionDTO.setQuestion(listeningQuestionEntity.getQuestion());
        listeningQuestionDTO.setImage(listeningQuestionEntity.getImage());
        listeningQuestionDTO.setAudio(listeningQuestionEntity.getAudio());
        listeningQuestionDTO.setOption1(listeningQuestionEntity.getOption1());
        listeningQuestionDTO.setOption2(listeningQuestionEntity.getOption2());
        listeningQuestionDTO.setOption3(listeningQuestionEntity.getOption3());
        listeningQuestionDTO.setOption4(listeningQuestionEntity.getOption4());
        listeningQuestionDTO.setCorrectOption(listeningQuestionEntity.getCorrectOption());
        listeningQuestionDTO.setReason(listeningQuestionEntity.getReason());
        listeningQuestionDTO.setListeningId(listeningQuestionEntity.getListening().getId());
        return listeningQuestionDTO;
    }

    public ListeningQuestionEntity toEntity(ListeningQuestionDTO listeningQuestionDTO){
        Optional<ListeningEntity> optional = listeningRepository.findById(listeningQuestionDTO.getListeningId());
        ListeningQuestionEntity listeningQuestionEntity = new ListeningQuestionEntity();
        if(listeningQuestionDTO.getId() != 0){
            listeningQuestionEntity.setId(listeningQuestionDTO.getId());
        }
        listeningQuestionEntity.setImage(listeningQuestionDTO.getImage());
        listeningQuestionEntity.setAudio(listeningQuestionDTO.getAudio());
        listeningQuestionEntity.setQuestion(listeningQuestionDTO.getQuestion());
        listeningQuestionEntity.setOption1(listeningQuestionDTO.getOption1());
        listeningQuestionEntity.setOption2(listeningQuestionDTO.getOption2());
        listeningQuestionEntity.setOption3(listeningQuestionDTO.getOption3());
        listeningQuestionEntity.setOption4(listeningQuestionDTO.getOption4());
        listeningQuestionEntity.setCorrectOption(listeningQuestionDTO.getCorrectOption());
        listeningQuestionEntity.setReason(listeningQuestionDTO.getReason());
        if(optional.isPresent()){
            listeningQuestionEntity.setListening(optional.get());
        }
        return listeningQuestionEntity;
    }
}
