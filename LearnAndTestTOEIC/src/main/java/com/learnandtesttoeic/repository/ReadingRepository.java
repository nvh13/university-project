package com.learnandtesttoeic.repository;

import com.learnandtesttoeic.entity.ReadingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReadingRepository extends JpaRepository<ReadingEntity, Long> {

}
