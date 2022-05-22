package com.learnandtesttoeic.api;

import com.learnandtesttoeic.constant.ServiceCode;
import com.learnandtesttoeic.dto.ListeningQuestionDTO;
import com.learnandtesttoeic.dto.WrapperDTO;
import com.learnandtesttoeic.service.IListeningQuestionService;
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
public class ListeningQuestionAPI {

    private static final String IMAGE_RESOURCES = "/resources/file/images/listening/";
    private static final String AUDIO_RESOURCES = "/resources/file/audio/listening/";
    @Autowired
    private HttpServletRequest request;
    @Autowired
    IListeningQuestionService iListeningQuestionService;

    @GetMapping("/api/v1/listeningQuestion")
    public WrapperDTO<List<ListeningQuestionDTO>> getListening(@RequestParam("page") int page,
                                                               @RequestParam("per_page") int perPage,
                                                               @RequestParam("id") Long id){
        Pageable pageable = PageRequest.of(page - 1, perPage);
        int totalPage = (int) Math.ceil((double)iListeningQuestionService.count(id) / perPage);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iListeningQuestionService.findAllByListeningId(id, pageable), totalPage);
    }

    @GetMapping("/api/v1/listeningQuestionById")
    public WrapperDTO<ListeningQuestionDTO> getAListening(@RequestParam("id") Long id){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iListeningQuestionService.findById(id), 0);
    }

    @PostMapping("/api/v1/listeningQuestion")
    public WrapperDTO<List<ListeningQuestionDTO>> createListening(@RequestParam("listening_id") Long listeningId,
                                                                  @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                                  @RequestParam(value = "audioFile", required = false) MultipartFile audioFile,
                                                                  @ModelAttribute ListeningQuestionDTO listeningQuestionDTO){
        listeningQuestionDTO.setListeningId(listeningId);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            listeningQuestionDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            listeningQuestionDTO.setImage("");
        }
        if(audioFile != null){
            String audioName = audioFile.getOriginalFilename();
            Path pathAudio = Paths.get(rootDirectory + AUDIO_RESOURCES + audioName);
            listeningQuestionDTO.setAudio(audioName);
            try {
                audioFile.transferTo(new File(pathAudio.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            listeningQuestionDTO.setAudio("");
        }
        iListeningQuestionService.saveListeningQuestion(listeningQuestionDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, null, 0);
    }

    @PutMapping("/api/v1/listeningQuestion")
    public WrapperDTO<List<ListeningQuestionDTO>> updateListening(@RequestParam("id") Long id,
                                                                  @RequestParam("listening_id") Long listeningId,
                                                                  @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                                  @RequestParam(value = "audioFile", required = false) MultipartFile audioFile,
                                                                  @ModelAttribute ListeningQuestionDTO listeningQuestionDTO){
        ListeningQuestionDTO listeningQuestionDTO1 = iListeningQuestionService.findById(id);
        listeningQuestionDTO.setId(id);
        listeningQuestionDTO.setListeningId(listeningId);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            listeningQuestionDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            listeningQuestionDTO.setImage(listeningQuestionDTO1.getImage());
        }
        if(audioFile != null){
            String audioName = audioFile.getOriginalFilename();
            Path pathAudio = Paths.get(rootDirectory + AUDIO_RESOURCES + audioName);
            listeningQuestionDTO.setAudio(audioName);
            try {
                audioFile.transferTo(new File(pathAudio.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            listeningQuestionDTO.setAudio(listeningQuestionDTO1.getAudio());
        }
        iListeningQuestionService.saveListeningQuestion(listeningQuestionDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.UPDATE_SUCCESS_MESSAGE, null, 0);
    }

    @DeleteMapping("/api/v1/listeningQuestion")
    public WrapperDTO<List<ListeningQuestionDTO>> deleteListening(@RequestBody Long[] ids){
        iListeningQuestionService.delete(ids);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.DELETE_SUCCESS_MESSAGE, null, 0);
    }

    @GetMapping("/api/v1/listeningQuestion/search")
    public WrapperDTO<List<ListeningQuestionDTO>> getSearchListening(@RequestParam("id") Long id,
                                                                     @RequestParam(value = "keyword", required = false) String keyword){
        if(keyword.equals(""))
            return new WrapperDTO<>(ServiceCode.ERROR_CODE, "Must enter at least 1 character", null, 0);
        List<ListeningQuestionDTO> listeningQuestionDTOS = iListeningQuestionService.searching(keyword, id);
        if(listeningQuestionDTOS.isEmpty())
            return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.NOT_FOUND_MESSAGE, null, 0);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.SEARCH_SUCCESS_MESSAGE, iListeningQuestionService.searching(keyword, id), 0);
    }

    @GetMapping("/api/v1/listListeningQuestion")
    public WrapperDTO<List<ListeningQuestionDTO>> getListListeningQuestion(@RequestParam("listening_id") Long listeningId,
                                                                        @RequestParam("index") int index){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iListeningQuestionService.getListListeningQuestion(listeningId, index), iListeningQuestionService.selectiveCounting(listeningId));
    }
}
