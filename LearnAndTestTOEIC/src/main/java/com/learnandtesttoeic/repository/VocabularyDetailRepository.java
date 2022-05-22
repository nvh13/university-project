package com.learnandtesttoeic.repository;

import com.learnandtesttoeic.entity.VocabularyDetailEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VocabularyDetailRepository extends JpaRepository<VocabularyDetailEntity, Long> {
    List<VocabularyDetailEntity> findAllByVocabularyId(Long vocabularyId, Pageable pageable);

    @Query("SELECT COUNT(u) FROM VocabularyDetailEntity u WHERE u.vocabulary.id = ?1")
    Long countByVocabularyId(Long vocabularyId);

    @Query("SELECT vd FROM VocabularyDetailEntity vd WHERE vd.vocabulary.id = ?2 AND (vd.example LIKE %?1%"
                                                     + " OR vd.meaning  LIKE %?1%"
                                                     + " OR vd.spelling  LIKE %?1%"
                                                     + " OR vd.name  LIKE %?1%"
                                                     + " OR vd.image  LIKE %?1%"
                                                     + " OR vd.audio  LIKE %?1%"
                                                     + " OR vd.wordType   LIKE %?1%)"
    )
    List<VocabularyDetailEntity> search(String keyword, Long vocabularyId);
}
