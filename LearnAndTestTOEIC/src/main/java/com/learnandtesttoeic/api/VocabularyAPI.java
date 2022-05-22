package com.learnandtesttoeic.api;

import com.learnandtesttoeic.constant.ServiceCode;
import com.learnandtesttoeic.dto.VocabularyDTO;
import com.learnandtesttoeic.dto.WrapperDTO;
import com.learnandtesttoeic.service.IVocabularyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RestController
public class VocabularyAPI {
    private static final String IMAGE_RESOURCES = "/resources/file/images/vocabulary/";
    @Autowired
    private HttpServletRequest request;

    @Autowired
    IVocabularyService iVocabularyService;

    @GetMapping("/api/v1/vocabulary")
    public WrapperDTO<List<VocabularyDTO>> getVocabulary(@RequestParam("page") int page,
                                             @RequestParam("per_page") int perPage){
        Pageable pageable = PageRequest.of(page - 1, perPage);
        int totalPage = (int) Math.ceil((double)iVocabularyService.count() / perPage);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, iVocabularyService.findAll(pageable), totalPage);
    }

    @PostMapping("/api/v1/vocabulary")
    public WrapperDTO<VocabularyDTO> createVocabulary(@RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                     @ModelAttribute VocabularyDTO vocabularyDTO){
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            vocabularyDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            vocabularyDTO.setImage("");
        }
        iVocabularyService.saveVocabulary(vocabularyDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, null, 0);
    }

    @PutMapping("/api/v1/vocabulary")
    public WrapperDTO<VocabularyDTO> updateVocabulary(@RequestParam("id") Long id,
                                                     @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                     @ModelAttribute VocabularyDTO vocabularyDTO){
        VocabularyDTO vocabularyDTO1 = iVocabularyService.findById(id);
        vocabularyDTO.setId(id);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            vocabularyDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            vocabularyDTO.setImage(vocabularyDTO1.getImage());
        }
        iVocabularyService.saveVocabulary(vocabularyDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.UPDATE_SUCCESS_MESSAGE, null, 0);
    }

    @GetMapping("/api/v1/vocabularyById")
    public WrapperDTO<VocabularyDTO> getAVocabulary(@RequestParam("id") Long id){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, iVocabularyService.findById(id), 0);
    }

    @DeleteMapping("/api/v1/vocabulary")
    public WrapperDTO<VocabularyDTO> deleteVocabulary(@RequestBody Long id){
        iVocabularyService.delete(id);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.DELETE_SUCCESS_MESSAGE, null, 0);
    }
}
