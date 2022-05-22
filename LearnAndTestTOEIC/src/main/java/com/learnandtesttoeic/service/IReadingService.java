package com.learnandtesttoeic.service;

import com.learnandtesttoeic.dto.ReadingDTO;

import java.util.List;

public interface IReadingService {
    List<ReadingDTO> findAll();

    ReadingDTO getReadingById(Long id);
}
