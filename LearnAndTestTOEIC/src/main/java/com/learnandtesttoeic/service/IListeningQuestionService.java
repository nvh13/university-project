package com.learnandtesttoeic.service;
import com.learnandtesttoeic.dto.ListeningQuestionDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IListeningQuestionService {
     List<ListeningQuestionDTO> findAllByListeningId(Long listeningId, Pageable pageable);
     Long count(Long listeningId);
     void saveListeningQuestion(ListeningQuestionDTO listeningQuestionDTO);
     void delete(Long[] ids);
     ListeningQuestionDTO findById(Long id);
     List<ListeningQuestionDTO> searching(String keyword, Long listeningId);

     List<ListeningQuestionDTO> getListListeningQuestion(Long listeningId, int index);

     int selectiveCounting(Long listeningId);
}
