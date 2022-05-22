package com.learnandtesttoeic.service;

import com.learnandtesttoeic.dto.ResultDTO;

import java.util.Map;

public interface IResultService {
    ResultDTO scored(Map<Long, String> answers, Long examId, String userName);
}
