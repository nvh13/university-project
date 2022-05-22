package com.learnandtesttoeic.repository;

import com.learnandtesttoeic.entity.ReadingQuestionEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReadingQuesionRepository extends JpaRepository<ReadingQuestionEntity, Long> {
    List<ReadingQuestionEntity> findAllByReadingId(Long readingId, Pageable pageable);
    List<ReadingQuestionEntity> findAllByReadingId(Long readingId);
    @Query("SELECT COUNT(u) FROM ReadingQuestionEntity u WHERE u.reading.id = ?1")
    Long countByReadingId(Long readingId);

    @Query("SELECT rq FROM ReadingQuestionEntity rq WHERE rq.reading.id = ?2 AND (rq.question LIKE %?1%"
                                                     + " OR rq.option1  LIKE %?1%"
                                                     + " OR rq.option2  LIKE %?1%"
                                                     + " OR rq.option3  LIKE %?1%"
                                                     + " OR rq.option4  LIKE %?1%"
                                                     + " OR rq.paragraph  LIKE %?1%"
                                                     + " OR rq.reason   LIKE %?1%)"
    )
    List<ReadingQuestionEntity> search(String keyword, Long readingId);
}
