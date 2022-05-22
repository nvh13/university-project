package com.learnandtesttoeic.service;

import com.learnandtesttoeic.dto.ListeningDTO;

import java.util.List;

public interface IListeningService {
    List<ListeningDTO > findAll();

    ListeningDTO getListeningById(Long id);
}
