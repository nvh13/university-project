package com.learnandtesttoeic.service;

import com.learnandtesttoeic.dto.PasswordDTO;
import com.learnandtesttoeic.dto.ResultDTO;
import com.learnandtesttoeic.dto.UserDTO;
import com.learnandtesttoeic.until.MyValidateException;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IUserService{
        void add(UserDTO userDTO) throws MyValidateException;

        void update(UserDTO userDTO) throws MyValidateException;
        List<UserDTO> findAll(Pageable pageable);
        Long count();
        UserDTO findById(Long id);

        List<ResultDTO> findResultByUsername(String userName);

        void changeStatus(Long[] ids);

        List<UserDTO> searching(String keyword);

        List<UserDTO> searchingByStatus(String keyword);

        List<UserDTO> searchingByRole(String keyword);

        void changePassword(Long id, PasswordDTO passwordDTO) throws MyValidateException;
}
