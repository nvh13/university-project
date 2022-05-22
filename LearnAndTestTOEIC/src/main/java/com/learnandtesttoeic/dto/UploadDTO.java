package com.learnandtesttoeic.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class UploadDTO<T> {
    private MultipartFile imageFile;
    private MultipartFile audioFile;
    private T data;
}
