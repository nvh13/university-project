package com.learnandtesttoeic.repository;
import com.learnandtesttoeic.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findByUserNameAndStatus(String userName, int status);
    Boolean existsByUserName(String userName);
    Boolean existsByEmail(String email);

    UserEntity findByUserName(String userName);

    @Query("SELECT u FROM UserEntity u WHERE u.userName LIKE %?1%"
            + " OR u.fullName  LIKE %?1%"
            + " OR u.image  LIKE %?1%"
            + " OR u.email LIKE %?1%"
    )
    List<UserEntity> search(String keyword);

    @Query("SELECT u FROM UserEntity u WHERE CONCAT(u.status, '') LIKE %?1%")
    List<UserEntity> searchByStatus(String keyword);
}
