package com.learnandtesttoeic.repository;

import com.learnandtesttoeic.entity.GrammarEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GrammarRepository  extends JpaRepository<GrammarEntity, Long> {
}
