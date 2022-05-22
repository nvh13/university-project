package com.learnandtesttoeic.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class WrapperDTO<T> {
    private int code;

    private String message;

    private T data;

    private int totalPage;
}
