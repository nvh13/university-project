package com.learnandtesttoeic.api;

import com.learnandtesttoeic.dto.ListeningDTO;
import com.learnandtesttoeic.service.IListeningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ListeningAPI {

    @Autowired
    IListeningService iListeningService;

    @GetMapping("/api/v1/listening")
    public List<ListeningDTO> getListening(){
        return iListeningService.findAll();
    }

    @GetMapping("/api/v1/listeningById")
    public ListeningDTO getListeningById(@RequestParam("id") Long id){
        return iListeningService.getListeningById(id);
    }
}
