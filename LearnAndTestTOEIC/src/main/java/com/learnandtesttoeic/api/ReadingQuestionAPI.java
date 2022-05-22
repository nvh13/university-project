package com.learnandtesttoeic.api;

import com.learnandtesttoeic.constant.ServiceCode;
import com.learnandtesttoeic.dto.ReadingQuestionDTO;
import com.learnandtesttoeic.dto.WrapperDTO;
import com.learnandtesttoeic.service.IReadingQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
public class ReadingQuestionAPI {
    @Autowired
    IReadingQuestionService iReadingQuestionService;

    @GetMapping("/api/v1/readingQuestion")
    public WrapperDTO<List<ReadingQuestionDTO>> getReading(@RequestParam("page") int page,
                                                               @RequestParam("per_page") int perPage,
                                                               @RequestParam("id") Long id){
        Pageable pageable = PageRequest.of(page - 1, perPage);
        int totalPage = (int) Math.ceil((double)iReadingQuestionService.count(id) / perPage);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iReadingQuestionService.findAllByReadingId(id, pageable), totalPage);
    }

    @GetMapping("/api/v1/readingQuestionById")
    public WrapperDTO<ReadingQuestionDTO> getAReading(@RequestParam("id") Long id){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iReadingQuestionService.findById(id), 0);
    }

    @PostMapping("/api/v1/readingQuestion")
    public WrapperDTO<List<ReadingQuestionDTO>> createReading(@RequestParam("reading_id") Long readingId,
                                                              @ModelAttribute ReadingQuestionDTO readingQuestionDTO){
        readingQuestionDTO.setReadingId(readingId);
        iReadingQuestionService.saveReadingQuestion(readingQuestionDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, null, 0);
    }

    @PutMapping("/api/v1/readingQuestion")
    public WrapperDTO<List<ReadingQuestionDTO>> updateReading(@RequestParam("id") Long id,
                                                                  @RequestParam("reading_id") Long readingId,
                                                                  @ModelAttribute ReadingQuestionDTO readingQuestionDTO){
        readingQuestionDTO.setId(id);
        readingQuestionDTO.setReadingId(readingId);
        iReadingQuestionService.saveReadingQuestion(readingQuestionDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.UPDATE_SUCCESS_MESSAGE, null, 0);
    }

    @DeleteMapping("/api/v1/readingQuestion")
    public WrapperDTO<List<ReadingQuestionDTO>> deleteReading(@RequestBody Long[] ids){
        iReadingQuestionService.delete(ids);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.DELETE_SUCCESS_MESSAGE, null, 0);
    }

    @GetMapping("/api/v1/readingQuestion/search")
    public WrapperDTO<List<ReadingQuestionDTO>> getSearchReading(@RequestParam("id") Long id,
                                                                     @RequestParam(value = "keyword", required = false) String keyword){
        if(keyword.equals(""))
            return new WrapperDTO<>(ServiceCode.ERROR_CODE, "Must enter at least 1 character", null, 0);
        List<ReadingQuestionDTO> readingQuestionDTOS = iReadingQuestionService.searching(keyword, id);
        if(readingQuestionDTOS.isEmpty())
            return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.NOT_FOUND_MESSAGE, null, 0);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.SEARCH_SUCCESS_MESSAGE, iReadingQuestionService.searching(keyword, id), 0);
    }

    @GetMapping("/api/v1/listReadingQuestion")
    public WrapperDTO<List<ReadingQuestionDTO>> getListReadingQuestion(@RequestParam("reading_id") Long readingId,
                                                                       @RequestParam("index") int index){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iReadingQuestionService.getListReadingQuestion(readingId, index), iReadingQuestionService.selectiveCounting(readingId));
    }
}
