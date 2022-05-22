package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.converter.ListeningQuestionConverter;
import com.learnandtesttoeic.dto.ListeningQuestionDTO;
import com.learnandtesttoeic.entity.ListeningQuestionEntity;
import com.learnandtesttoeic.repository.ListeningQuesionRepository;
import com.learnandtesttoeic.service.IListeningQuestionService;
import com.learnandtesttoeic.until.DuplicateElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class ListeningQuestionService implements IListeningQuestionService {

    @Autowired
    ListeningQuesionRepository listeningQuesionRepository;

    @Autowired
    ListeningQuestionConverter listeningQuestionConverter;

    @Override
    public List<ListeningQuestionDTO> findAllByListeningId(Long listeningId, Pageable pageable) {
        List<ListeningQuestionDTO> listeningQuestionDTOS = new ArrayList<>();
        listeningQuesionRepository.findAllByListeningId(listeningId, pageable).stream().forEach(listeningEntity -> listeningQuestionDTOS.add(listeningQuestionConverter.toDTO(listeningEntity)));
        return listeningQuestionDTOS;
    }

    @Override
    public Long count(Long listeningId) {
        return listeningQuesionRepository.countByListeningId(listeningId);
    }

    @Override
    public ListeningQuestionDTO findById(Long id) {
        ListeningQuestionDTO listeningQuestionDTO = new ListeningQuestionDTO();
        Optional<ListeningQuestionEntity> listeningQuestionEntity= listeningQuesionRepository.findById(id);
        if(listeningQuestionEntity.isPresent()){
            listeningQuestionDTO = listeningQuestionConverter.toDTO(listeningQuestionEntity.get());
        }
        return listeningQuestionDTO;
    }

    @Override
    public void saveListeningQuestion(ListeningQuestionDTO listeningQuestionDTO) {
        ListeningQuestionEntity listeningQuestionEntity =  listeningQuestionConverter.toEntity(listeningQuestionDTO);
        listeningQuesionRepository.save(listeningQuestionEntity);
    }

    @Override
    public void delete(Long[] ids) {
        Arrays.stream(ids).forEach(id -> listeningQuesionRepository.deleteById(id));
    }

    @Override
    public List<ListeningQuestionDTO> searching(String keyword, Long listeningId) {
        List<ListeningQuestionDTO> listeningQuestionDTOS = new ArrayList<>();
        listeningQuesionRepository.search(keyword,listeningId).stream().forEach(listeningEntity -> listeningQuestionDTOS.add(listeningQuestionConverter.toDTO(listeningEntity)));
        return listeningQuestionDTOS;
    }

    @Override
    public List<ListeningQuestionDTO> getListListeningQuestion(Long listeningId, int index) {
        DuplicateElement<String> duplicateElement = new DuplicateElement<>();
        List<ListeningQuestionDTO> listeningQuestionDTOS = new ArrayList<>();
        List<ListeningQuestionEntity> listeningQuestionEntities = listeningQuesionRepository.findAllByListeningId(listeningId);
        List<String> strings = new ArrayList<>();
        listeningQuestionEntities.stream().forEach(listeningQuestionEntity -> strings.add(listeningQuestionEntity.getAudio()));
        List<String> listGroup = duplicateElement.remove(strings);

        listeningQuestionEntities.stream().forEach(listeningQuestionEntity -> {
            if(listeningQuestionEntity.getAudio().equals(listGroup.get(index))){
                listeningQuestionDTOS.add(listeningQuestionConverter.toDTO(listeningQuestionEntity));
            }
        });
        return listeningQuestionDTOS;
    }

    @Override
    public int selectiveCounting(Long listeningId) {
        DuplicateElement<String> duplicateElement = new DuplicateElement<>();
        List<String> strings = new ArrayList<>();
        listeningQuesionRepository.findAllByListeningId(listeningId).stream().forEach(listeningQuestionEntity -> strings.add(listeningQuestionEntity.getAudio()));
        List<String> listGroup = duplicateElement.remove(strings);
        return listGroup.size();
    }
}
