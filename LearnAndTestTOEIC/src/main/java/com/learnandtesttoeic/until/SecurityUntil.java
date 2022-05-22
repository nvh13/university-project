package com.learnandtesttoeic.until;

import com.learnandtesttoeic.dto.MyUser;
import org.springframework.security.core.context.SecurityContextHolder;

public final class SecurityUntil {
    private SecurityUntil(){

    }

    public static MyUser getPrincipal(){
        return (MyUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
