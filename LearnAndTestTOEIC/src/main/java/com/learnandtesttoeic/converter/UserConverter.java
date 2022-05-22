package com.learnandtesttoeic.converter;

import com.learnandtesttoeic.dto.UserDTO;
import com.learnandtesttoeic.entity.UserEntity;
import org.springframework.stereotype.Component;
@Component
public class UserConverter {
    public UserDTO toDTO(UserEntity userEntity){
        UserDTO userDTO = new UserDTO();
        userDTO.setId(userEntity.getId());
        userDTO.setPassword(userEntity.getPassword());
        userDTO.setUserName(userEntity.getUserName());
        userDTO.setFullName(userEntity.getFullName());
        userDTO.setEmail(userEntity.getEmail());
        userDTO.setImage(userEntity.getImage());
        userDTO.setStatus(userEntity.getStatus());
        userDTO.setRole(userEntity.getRoles().get(0).getName());
        return userDTO;
    }
}
