package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.constant.SystemConstant;
import com.learnandtesttoeic.converter.ResultConverter;
import com.learnandtesttoeic.converter.UserConverter;
import com.learnandtesttoeic.dto.PasswordDTO;
import com.learnandtesttoeic.dto.ResultDTO;
import com.learnandtesttoeic.dto.UserDTO;
import com.learnandtesttoeic.entity.RoleEntity;
import com.learnandtesttoeic.entity.UserEntity;
import com.learnandtesttoeic.repository.RoleRepository;
import com.learnandtesttoeic.repository.UserRepository;
import com.learnandtesttoeic.service.IUserService;
import com.learnandtesttoeic.until.MyValidateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class UserService implements IUserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    UserConverter userConverter;

    @Autowired
    ResultConverter resultConverter;

    @Override
    public List<UserDTO> findAll(Pageable pageable) {
        List<UserDTO> userDTOS = new ArrayList<>();
        userRepository.findAll(pageable).forEach(userEntity -> userDTOS.add(userConverter.toDTO(userEntity)));
        return userDTOS;
    }

    @Override
    public Long count() {
        return userRepository.count();
    }

    @Override
    public void add(UserDTO userDTO) throws MyValidateException{
        UserEntity userEntity = new UserEntity();
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
        if(Boolean.TRUE.equals(userRepository.existsByUserName(userDTO.getUserName()))){
            throw new MyValidateException("Tên tài khoản đã tồn tại.");
        }else{
            userEntity.setUserName(userDTO.getUserName());
        }
        if(userDTO.getPassword().equals(userDTO.getRePassword())){
            userEntity.setPassword(encoder.encode(userDTO.getPassword()));
        }else{
            throw new MyValidateException("Mật khẩu phải khớp với nhau.");
        }
        userEntity.setFullName(userDTO.getFullName());
        userEntity.setImage("default.jpg");
        if(Boolean.TRUE.equals(userRepository.existsByEmail(userDTO.getEmail()))){
            throw new MyValidateException("Email đã tồn tại.");
        }else{
            userEntity.setEmail(userDTO.getEmail());
        }
        userEntity.setStatus(SystemConstant.ACTIVE_STATUS);

        List<RoleEntity> roleEntityList = new ArrayList<>();
        if(userDTO.getRole() == null)
            roleEntityList.add(roleRepository.getById(2L));
        else
            roleEntityList.add(roleRepository.getByName(userDTO.getRole()));
        userEntity.setRoles(roleEntityList);
        userRepository.save(userEntity);
    }

    @Override
    public UserDTO findById(Long id) {
        UserDTO userDTO = new UserDTO();
        Optional<UserEntity> userEntity= userRepository.findById(id);
        if(userEntity.isPresent()){
            userDTO = userConverter.toDTO(userEntity.get());
        }
        return userDTO;
    }

    @Override
    public void update(UserDTO userDTO) throws MyValidateException {
        UserEntity userEntity = new UserEntity();
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
        UserEntity oldUser = new UserEntity();
        Optional<UserEntity> optional = userRepository.findById(userDTO.getId());
        if(optional.isPresent()){
            oldUser = optional.get();
        }
        userEntity.setId(userDTO.getId());
        try{
            userEntity.setUserName(checkedUserName(oldUser.getUserName(), userDTO.getUserName()));
        }catch (MyValidateException e){
            throw new MyValidateException(e.getMessage());
        }
        if(userDTO.getPassword() == null || userDTO.getPassword().isEmpty()){
            userEntity.setPassword(oldUser.getPassword());
        }else if(!userDTO.getPassword().equals(userDTO.getRePassword())){
            throw new MyValidateException("Mật khẩu phải khớp với nhau.");
        }else if(encoder.matches(userDTO.getPassword(), oldUser.getPassword())){
            throw new MyValidateException("Mật khẩu mới không được trùng với mật khẩu cũ.");
        }else{
            userEntity.setPassword(encoder.encode(userDTO.getPassword()));
        }
        if(userDTO.getFullName() == null || userDTO.getFullName().isEmpty()){
            userEntity.setFullName(oldUser.getFullName());
        }else{
            userEntity.setFullName(userDTO.getFullName());
        }
        userEntity.setImage(userDTO.getImage());
        try{
            userEntity.setEmail(checkedEmail(oldUser.getEmail(), userDTO.getEmail()));
        }catch (MyValidateException e){
            throw new MyValidateException(e.getMessage());
        }

        if(userDTO.getRole() == null || userDTO.getRole().isEmpty()){
            userEntity.setRoles(oldUser.getRoles());
        }else{
            List<RoleEntity> roleEntityList = new ArrayList<>();
            roleEntityList.add(roleRepository.getByName(userDTO.getRole()));
            userEntity.setRoles(roleEntityList);
        }
        userEntity.setResultEntities(oldUser.getResultEntities());
        userEntity.setStatus(oldUser.getStatus());

        userRepository.save(userEntity);
    }

    @Override
    public List<ResultDTO> findResultByUsername(String userName) {
        List<ResultDTO> resultDTOS = new ArrayList<>();
        userRepository.findByUserName(userName).getResultEntities().forEach(resultEntity -> resultDTOS.add(resultConverter.toDTO(resultEntity)));
        return resultDTOS;
    }

    @Override
    public void changeStatus(Long[] ids) {
        Arrays.stream(ids).forEach(id -> {
            UserEntity userEntity = userRepository.findById(id).get();
            int status = userEntity.getStatus() == SystemConstant.ACTIVE_STATUS ? SystemConstant.INACTIVE_STATUS : SystemConstant.ACTIVE_STATUS;
            userEntity.setStatus(status);
            userRepository.save(userEntity);
        });
    }

    @Override
    public List<UserDTO> searching(String keyword) {
        List<UserDTO> userDTOS = new ArrayList<>();
        userRepository.search(keyword).stream().forEach(userEntity -> userDTOS.add(userConverter.toDTO(userEntity)));
        return userDTOS;
    }

    @Override
    public List<UserDTO> searchingByStatus(String keyword) {
        List<UserDTO> userDTOS = new ArrayList<>();
        userRepository.searchByStatus(keyword).stream().forEach(userEntity -> userDTOS.add(userConverter.toDTO(userEntity)));
        return userDTOS;
    }

    @Override
    public List<UserDTO> searchingByRole(String keyword) {
        List<UserDTO> userDTOS = new ArrayList<>();
        userRepository.findAll().forEach(userEntity -> {
            if(userEntity.getRoles().get(0).getName().equals(keyword)){
                userDTOS.add(userConverter.toDTO(userEntity));
            }
        });
        return userDTOS;
    }

    @Override
    public void changePassword(Long id, PasswordDTO passwordDTO) throws MyValidateException{
        Optional<UserEntity> optional =  userRepository.findById(id);
        UserEntity userEntity = new UserEntity();
        if(optional.isPresent()){
            userEntity = optional.get();
        }
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if(!encoder.matches(passwordDTO.getOldPassword(), userEntity.getPassword())){
            throw new MyValidateException("Sai mật khẩu cũ!");
        }else if(!passwordDTO.getNewPassword().equals(passwordDTO.getReNewPassword())){
            throw new MyValidateException("Mật khẩu mới không khớp với nhau!");
        }else if(passwordDTO.getNewPassword().equals(passwordDTO.getOldPassword())){
            throw new MyValidateException("Mật khẩu mới và mật khẩu cũ không được giống nhau!");
        }else{
            userEntity.setPassword(encoder.encode(passwordDTO.getNewPassword()));
            userRepository.save(userEntity);
        }
    }

    private String checkedUserName(String oldUsername, String newUserName) throws MyValidateException{
        if(newUserName == null || newUserName.isEmpty()) {
            return oldUsername;
        }
        if(Boolean.TRUE.equals(userRepository.existsByUserName(newUserName))){
            throw new MyValidateException("Tên tài khoản đã tồn tại.");
        }
        return newUserName;
    }

    private String checkedEmail(String oldEmail, String newEmail) throws MyValidateException{
        if(newEmail == null || newEmail.isEmpty()) {
            return oldEmail;
        }
        if(Boolean.TRUE.equals(userRepository.existsByEmail(newEmail))){
            throw new MyValidateException("Email đã tồn tại.");
        }
        return newEmail;
    }
}
