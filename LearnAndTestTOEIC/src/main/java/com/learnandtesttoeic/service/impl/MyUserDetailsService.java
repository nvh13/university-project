package com.learnandtesttoeic.service.impl;

import com.learnandtesttoeic.constant.SystemConstant;
import com.learnandtesttoeic.dto.MyUser;
import com.learnandtesttoeic.entity.UserEntity;
import com.learnandtesttoeic.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity userEntity = userRepository.findByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);

        if(userEntity == null){
            throw  new UsernameNotFoundException("Username was not found");
        }

        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        userEntity.getRoles().stream().forEach(role -> grantedAuthorities.add(new SimpleGrantedAuthority(role.getName())));

        MyUser user = new MyUser(userEntity.getUserName(), userEntity.getPassword(), true, true, true, true, grantedAuthorities);
        user.setFullName(userEntity.getFullName());
        user.setImage(userEntity.getImage());
        user.setEmail(userEntity.getEmail());
        user.setId(userEntity.getId());
        return user;
    }
}
