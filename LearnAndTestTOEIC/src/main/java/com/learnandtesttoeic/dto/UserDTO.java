package com.learnandtesttoeic.dto;

import lombok.Data;

@Data
public class UserDTO {

    private Long id;

    private String userName;

    private String password;

    private String rePassword;

    private String fullName;

    private String image;

    private String email;

    private int status;

    private String role;
}
