package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.converter.ReadingConverter;
import com.learnandtesttoeic.dto.ReadingDTO;
import com.learnandtesttoeic.entity.ReadingEntity;
import com.learnandtesttoeic.repository.ReadingRepository;
import com.learnandtesttoeic.service.IReadingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ReadingService implements IReadingService {

    @Autowired
    ReadingRepository readingRepository;

    @Autowired
    ReadingConverter readingConverter;

    @Override
    public List<ReadingDTO> findAll() {
        List<ReadingDTO> readingDTOS = new ArrayList<>();
        readingRepository.findAll().stream().forEach(readingEntity -> readingDTOS.add(readingConverter.toDTO(readingEntity)));
        return readingDTOS;
    }

    @Override
    public ReadingDTO getReadingById(Long id) {
        ReadingDTO readingDTO = new ReadingDTO();
        Optional<ReadingEntity> readingEntity= readingRepository.findById(id);
        if(readingEntity.isPresent()){
            readingDTO = readingConverter.toDTO(readingEntity.get());
        }
        return readingDTO;
    }
}
