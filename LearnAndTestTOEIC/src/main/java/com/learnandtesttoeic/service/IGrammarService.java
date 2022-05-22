package com.learnandtesttoeic.service;

import com.learnandtesttoeic.dto.GrammarDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IGrammarService {
    public GrammarDTO findById(Long id);
    public void saveGrammar(GrammarDTO grammarDTO);

    public void delete(Long id);
    List<GrammarDTO> getNameAndId(Pageable pageable);

    Long count();
}
