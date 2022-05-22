package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.converter.ListeningConverter;
import com.learnandtesttoeic.dto.ListeningDTO;
import com.learnandtesttoeic.entity.ListeningEntity;
import com.learnandtesttoeic.repository.ListeningRepository;
import com.learnandtesttoeic.service.IListeningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ListeningService implements IListeningService {

    @Autowired
    ListeningRepository listeningRepository;

    @Autowired
    ListeningConverter listeningConverter;

    @Override
    public List<ListeningDTO> findAll() {
        List<ListeningDTO> listeningDTOS = new ArrayList<>();
        listeningRepository.findAll().stream().forEach(listeningEntity -> listeningDTOS.add(listeningConverter.toDTO(listeningEntity)));
        return listeningDTOS;
    }

    @Override
    public ListeningDTO getListeningById(Long id) {
        ListeningDTO listeningDTO = new ListeningDTO();
        Optional<ListeningEntity> listeningEntity= listeningRepository.findById(id);
        if(listeningEntity.isPresent()){
            listeningDTO = listeningConverter.toDTO(listeningEntity.get());
        }
        return listeningDTO;
    }
}
