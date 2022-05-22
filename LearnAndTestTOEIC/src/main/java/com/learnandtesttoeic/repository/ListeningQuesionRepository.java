package com.learnandtesttoeic.repository;

import com.learnandtesttoeic.entity.ListeningQuestionEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ListeningQuesionRepository extends JpaRepository<ListeningQuestionEntity, Long> {
    List<ListeningQuestionEntity> findAllByListeningId(Long listeningId, Pageable pageable);
    List<ListeningQuestionEntity> findAllByListeningId(Long listeningId);

    @Query("SELECT COUNT(u) FROM ListeningQuestionEntity u WHERE u.listening.id = ?1")
    Long countByListeningId(Long listeningId);

    @Query("SELECT lq FROM ListeningQuestionEntity lq WHERE lq.listening.id = ?2 AND (lq.question LIKE %?1%"
                                                     + " OR lq.option1  LIKE %?1%"
                                                     + " OR lq.option2  LIKE %?1%"
                                                     + " OR lq.option3  LIKE %?1%"
                                                     + " OR lq.option4  LIKE %?1%"
                                                     + " OR lq.image  LIKE %?1%"
                                                     + " OR lq.audio  LIKE %?1%"
                                                     + " OR lq.reason   LIKE %?1%)"
    )
    List<ListeningQuestionEntity> search(String keyword, Long listeningId);
}
