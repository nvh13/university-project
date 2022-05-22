package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.converter.GrammarConverter;
import com.learnandtesttoeic.dto.GrammarDTO;
import com.learnandtesttoeic.entity.GrammarEntity;
import com.learnandtesttoeic.repository.GrammarRepository;
import com.learnandtesttoeic.service.IGrammarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class GrammarService implements IGrammarService {

    @Autowired
    GrammarRepository grammarRepository;

    @Autowired
    GrammarConverter grammarConverter;

    @Override
    public GrammarDTO findById(Long id) {
        GrammarDTO grammarDTO = new GrammarDTO();
        Optional<GrammarEntity> vocabularyDetailEntity= grammarRepository.findById(id);
        if(vocabularyDetailEntity.isPresent()){
            grammarDTO = grammarConverter.toDTO(vocabularyDetailEntity.get());
        }
        return grammarDTO;
    }

    @Override
    public List<GrammarDTO> getNameAndId(Pageable pageable) {
        List<GrammarDTO> grammarDTOS = new ArrayList<>();
        grammarRepository.findAll(pageable).stream().forEach(grammarEntity -> {
            GrammarDTO grammarDTO = grammarConverter.toDTO(grammarEntity);
            grammarDTOS.add(grammarDTO);
        });
        return grammarDTOS;
    }

    @Override
    public void saveGrammar(GrammarDTO grammarDTO) {
        GrammarEntity grammarEntity =  grammarConverter.toEntity(grammarDTO);
        grammarRepository.save(grammarEntity);
    }

    @Override
    public Long count() {
        return grammarRepository.count();
    }

    @Override
    public void delete(Long id) {
        grammarRepository.deleteById(id);
    }
}
