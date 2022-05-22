package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.converter.ReadingQuestionConverter;
import com.learnandtesttoeic.dto.ReadingQuestionDTO;
import com.learnandtesttoeic.entity.ReadingQuestionEntity;
import com.learnandtesttoeic.repository.ReadingQuesionRepository;
import com.learnandtesttoeic.service.IReadingQuestionService;
import com.learnandtesttoeic.until.DuplicateElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class ReadingQuestionService implements IReadingQuestionService {

    @Autowired
    ReadingQuesionRepository readingQuesionRepository;

    @Autowired
    ReadingQuestionConverter readingQuestionConverter;

    @Override
    public List<ReadingQuestionDTO> findAllByReadingId(Long readingId, Pageable pageable) {
        List<ReadingQuestionDTO> readingQuestionDTOS = new ArrayList<>();
        readingQuesionRepository.findAllByReadingId(readingId, pageable).stream().forEach(readingEntity -> readingQuestionDTOS.add(readingQuestionConverter.toDTO(readingEntity)));
        return readingQuestionDTOS;
    }

    @Override
    public Long count(Long readingId) {
        return readingQuesionRepository.countByReadingId(readingId);
    }

    @Override
    public ReadingQuestionDTO findById(Long id) {
        ReadingQuestionDTO readingQuestionDTO = new ReadingQuestionDTO();
        Optional<ReadingQuestionEntity> readingQuestionEntity= readingQuesionRepository.findById(id);
        if(readingQuestionEntity.isPresent()){
            readingQuestionDTO = readingQuestionConverter.toDTO(readingQuestionEntity.get());
        }
        return readingQuestionDTO;
    }

    @Override
    public void saveReadingQuestion(ReadingQuestionDTO readingQuestionDTO) {
        ReadingQuestionEntity readingQuestionEntity =  readingQuestionConverter.toEntity(readingQuestionDTO);
        readingQuesionRepository.save(readingQuestionEntity);
    }

    @Override
    public void delete(Long[] ids) {
        Arrays.stream(ids).forEach(id -> readingQuesionRepository.deleteById(id));
    }

    @Override
    public List<ReadingQuestionDTO> searching(String keyword, Long readingId) {
        List<ReadingQuestionDTO> readingQuestionDTOS = new ArrayList<>();
        readingQuesionRepository.search(keyword,readingId).stream().forEach(readingEntity -> readingQuestionDTOS.add(readingQuestionConverter.toDTO(readingEntity)));
        return readingQuestionDTOS;
    }

    @Override
    public List<ReadingQuestionDTO> getListReadingQuestion(Long readingId, int index) {
        DuplicateElement<String> duplicateElement = new DuplicateElement<>();
        List<ReadingQuestionDTO> readingQuestionDTOS = new ArrayList<>();
        List<ReadingQuestionEntity> readingQuestionEntities = readingQuesionRepository.findAllByReadingId(readingId);
        List<String> strings = new ArrayList<>();
        readingQuestionEntities.stream().forEach(readingQuestionEntity -> strings.add(readingQuestionEntity.getParagraph()));
        List<String> listGroup = duplicateElement.remove(strings);

        readingQuestionEntities.stream().forEach(readingQuestionEntity -> {
            if(readingQuestionEntity.getParagraph().equals(listGroup.get(index))){
                readingQuestionDTOS.add(readingQuestionConverter.toDTO(readingQuestionEntity));
            }
        });
        return readingQuestionDTOS;
    }

    @Override
    public int selectiveCounting(Long readingId) {
        DuplicateElement<String> duplicateElement = new DuplicateElement<>();
        List<String> strings = new ArrayList<>();
        readingQuesionRepository.findAllByReadingId(readingId).stream().forEach(readingQuestionEntity -> strings.add(readingQuestionEntity.getParagraph()));
        List<String> listGroup = duplicateElement.remove(strings);
        return listGroup.size();
    }
}
