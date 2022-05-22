package com.learnandtesttoeic.repository;

import com.learnandtesttoeic.entity.ListeningEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ListeningRepository extends JpaRepository<ListeningEntity, Long> {
}
