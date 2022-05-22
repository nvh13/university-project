package com.learnandtesttoeic.api;

import com.learnandtesttoeic.dto.ReadingDTO;
import com.learnandtesttoeic.service.IReadingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ReadingAPI {

    @Autowired
    IReadingService iReadingService;

    @GetMapping("/api/v1/reading")
    public List<ReadingDTO> getReading(){
        return iReadingService.findAll();
    }

    @GetMapping("/api/v1/readingById")
    public ReadingDTO getReadingById(@RequestParam("id") Long id){
        return iReadingService.getReadingById(id);
    }
}
