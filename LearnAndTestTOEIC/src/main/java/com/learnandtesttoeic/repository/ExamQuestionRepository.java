package com.learnandtesttoeic.repository;

import com.learnandtesttoeic.entity.ExamQuestionEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExamQuestionRepository extends JpaRepository<ExamQuestionEntity, Long> {
    List<ExamQuestionEntity> findAllByExamId(Long examId, Pageable pageable);

    List<ExamQuestionEntity> findAllByExamId(Long examId);

    List<ExamQuestionEntity> findAllByExamIdAndGroupQuestion(Long examId, int index);

    @Query("SELECT COUNT(u) FROM ExamQuestionEntity u WHERE u.exam.id = ?1")
    Long countByExamId(Long examId);

    @Query("SELECT eq FROM ExamQuestionEntity eq WHERE eq.exam.id = ?2 AND (eq.option1 LIKE %?1%"
                                                     + " OR eq.option2  LIKE %?1%"
                                                     + " OR eq.option3  LIKE %?1%"
                                                     + " OR eq.option4  LIKE %?1%"
                                                     + " OR eq.question  LIKE %?1%"
                                                     + " OR eq.description  LIKE %?1%"
                                                     + " OR eq.image  LIKE %?1%"
                                                     + " OR eq.audio  LIKE %?1%"
                                                     + " OR CONCAT(eq.part, '')  LIKE %?1%"
                                                     + " OR eq.paragraph   LIKE %?1%)"
    )
    List<ExamQuestionEntity> search(String keyword, Long examId);
}
