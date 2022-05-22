package com.learnandtesttoeic.api;

import com.learnandtesttoeic.constant.ServiceCode;
import com.learnandtesttoeic.dto.VocabularyDetailDTO;
import com.learnandtesttoeic.dto.WrapperDTO;
import com.learnandtesttoeic.service.IVocabularyDetailService;
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
public class VocabularyDetailAPI {
    private static final String IMAGE_RESOURCES = "/resources/file/images/vocabulary/";

    private static final String AUDIO_RESOURCES = "/resources/file/audio/vocabulary/";
    @Autowired
    private HttpServletRequest request;
    @Autowired
    IVocabularyDetailService iVocabularyDetailService;

    @GetMapping("/api/v1/vocabularyDetail")
    public WrapperDTO<List<VocabularyDetailDTO>> getVocabulary(@RequestParam("page") int page,
                                                              @RequestParam("per_page") int perPage,
                                                              @RequestParam("id") Long id){
        Pageable pageable = PageRequest.of(page - 1, perPage);
        int totalPage = (int) Math.ceil((double)iVocabularyDetailService.count(id) / perPage);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iVocabularyDetailService.findAllByVocabularyId(id, pageable), totalPage);
    }

    @GetMapping("/api/v1/vocabularyDetailById")
    public WrapperDTO<VocabularyDetailDTO> getAVocabulary(@RequestParam("id") Long id){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iVocabularyDetailService.findById(id), 0);
    }

    @PostMapping("/api/v1/vocabularyDetail")
    public WrapperDTO<List<VocabularyDetailDTO>> createVocabulary(@RequestParam("vocabulary_id") Long vocabularyId,
                                                                  @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                                  @RequestParam(value = "audioFile", required = false) MultipartFile audioFile,
                                                                  @ModelAttribute VocabularyDetailDTO vocabularyDetailDTO){
        vocabularyDetailDTO.setVocabularyId(vocabularyId);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            vocabularyDetailDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            vocabularyDetailDTO.setImage("");
        }
        if(audioFile != null){
            String audioName = audioFile.getOriginalFilename();
            Path pathAudio = Paths.get(rootDirectory + AUDIO_RESOURCES + audioName);
            vocabularyDetailDTO.setAudio(audioName);
            try {
                audioFile.transferTo(new File(pathAudio.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            vocabularyDetailDTO.setAudio("");
        }
        iVocabularyDetailService.saveVocabularyDetail(vocabularyDetailDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, null, 0);
    }

    @PutMapping("/api/v1/vocabularyDetail")
    public WrapperDTO<List<VocabularyDetailDTO>> updateVocabulary(@RequestParam("id") Long id,
                                                                  @RequestParam("vocabulary_id") Long vocabularyId,
                                                                  @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                                  @RequestParam(value = "audioFile", required = false) MultipartFile audioFile,
                                                                  @ModelAttribute VocabularyDetailDTO vocabularyDetailDTO){
        VocabularyDetailDTO vocabularyDetailDTO1 = iVocabularyDetailService.findById(id);
        vocabularyDetailDTO.setId(id);
        vocabularyDetailDTO.setVocabularyId(vocabularyId);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            vocabularyDetailDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            vocabularyDetailDTO.setImage(vocabularyDetailDTO1.getImage());
        }
        if(audioFile != null){
            String audioName = audioFile.getOriginalFilename();
            Path pathAudio = Paths.get(rootDirectory + AUDIO_RESOURCES + audioName);
            vocabularyDetailDTO.setAudio(audioName);
            try {
                audioFile.transferTo(new File(pathAudio.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            vocabularyDetailDTO.setAudio(vocabularyDetailDTO1.getAudio());
        }
        iVocabularyDetailService.saveVocabularyDetail(vocabularyDetailDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.UPDATE_SUCCESS_MESSAGE, null, 0);
    }

    @DeleteMapping("/api/v1/vocabularyDetail")
    public WrapperDTO<List<VocabularyDetailDTO>> deleteVocabulary(@RequestBody Long[] ids){
        iVocabularyDetailService.delete(ids);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.DELETE_SUCCESS_MESSAGE, null, 0);
    }

    @GetMapping("/api/v1/vocabularyDetail/search")
    public WrapperDTO<List<VocabularyDetailDTO>> getSearchVocabulary(@RequestParam("id") Long id,
                                                                     @RequestParam(value = "keyword", required = false) String keyword){
        if(keyword.equals(""))
            return new WrapperDTO<>(ServiceCode.ERROR_CODE, "Must enter at least 1 character", null, 0);
        List<VocabularyDetailDTO> vocabularyDetailDTOS = iVocabularyDetailService.searching(keyword, id);
        if(vocabularyDetailDTOS.isEmpty())
            return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.NOT_FOUND_MESSAGE, null, 0);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.SEARCH_SUCCESS_MESSAGE, iVocabularyDetailService.searching(keyword, id), 0);
    }
}
