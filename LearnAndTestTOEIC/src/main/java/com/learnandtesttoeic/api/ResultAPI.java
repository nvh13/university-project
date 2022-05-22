package com.learnandtesttoeic.api;

import com.learnandtesttoeic.constant.ServiceCode;
import com.learnandtesttoeic.dto.ResultDTO;
import com.learnandtesttoeic.dto.WrapperDTO;
import com.learnandtesttoeic.service.impl.ResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class ResultAPI {

    @Autowired
    ResultService resultService;

    @PostMapping("/api/v1/result")
    public WrapperDTO<ResultDTO> getScore(@RequestBody Map<Long, String> answers,
                                          @RequestParam("exam_id") Long examId,
                                          @RequestParam("userName") String userName){

        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, resultService.scored(answers, examId, userName), 0);
    }
}
