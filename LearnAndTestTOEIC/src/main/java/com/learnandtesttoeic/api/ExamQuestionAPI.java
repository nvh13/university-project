package com.learnandtesttoeic.api;

import com.learnandtesttoeic.constant.ServiceCode;
import com.learnandtesttoeic.dto.ExamQuestionDTO;
import com.learnandtesttoeic.dto.WrapperDTO;
import com.learnandtesttoeic.service.IExamQuestionService;
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
public class ExamQuestionAPI {
    private static final String IMAGE_RESOURCES = "/resources/file/images/exam/";
    private static final String AUDIO_RESOURCES = "/resources/file/audio/exam/";
    @Autowired
    private HttpServletRequest request;
    @Autowired
    IExamQuestionService iExamQuestionService;

    @GetMapping("/api/v1/examQuestion")
    public WrapperDTO<List<ExamQuestionDTO>> getExam(@RequestParam("page") int page,
                                                              @RequestParam("per_page") int perPage,
                                                              @RequestParam("id") Long id){
        Pageable pageable = PageRequest.of(page - 1, perPage);
        int totalPage = (int) Math.ceil((double)iExamQuestionService.count(id) / perPage);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iExamQuestionService.findAllByExamId(id, pageable), totalPage);
    }

    @GetMapping("/api/v1/examQuestionById")
    public WrapperDTO<ExamQuestionDTO> getAExam(@RequestParam("id") Long id){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iExamQuestionService.findById(id), 0);
    }

    @PostMapping("/api/v1/examQuestion")
    public WrapperDTO<List<ExamQuestionDTO>> createExam(@RequestParam("exam_id") Long examId,
                                                                  @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                                  @RequestParam(value = "audioFile", required = false) MultipartFile audioFile,
                                                                  @ModelAttribute ExamQuestionDTO examQuestionDTO){
        examQuestionDTO.setExamId(examId);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            examQuestionDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            examQuestionDTO.setImage("");
        }
        if(audioFile != null){
            String audioName = audioFile.getOriginalFilename();
            Path pathAudio = Paths.get(rootDirectory + AUDIO_RESOURCES + audioName);
            examQuestionDTO.setAudio(audioName);
            try {
                audioFile.transferTo(new File(pathAudio.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            examQuestionDTO.setAudio("");
        }
        iExamQuestionService.saveExamQuestion(examQuestionDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, null, 0);
    }

    @PutMapping("/api/v1/examQuestion")
    public WrapperDTO<List<ExamQuestionDTO>> updateExam(@RequestParam("id") Long id,
                                                                  @RequestParam("exam_id") Long examId,
                                                                  @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                                  @RequestParam(value = "audioFile", required = false) MultipartFile audioFile,
                                                                  @ModelAttribute ExamQuestionDTO examQuestionDTO){
        ExamQuestionDTO examQuestionDTO1 = iExamQuestionService.findById(id);
        examQuestionDTO.setId(id);
        examQuestionDTO.setExamId(examId);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            examQuestionDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            examQuestionDTO.setImage(examQuestionDTO1.getImage());
        }
        if(audioFile != null){
            String audioName = audioFile.getOriginalFilename();
            Path pathAudio = Paths.get(rootDirectory + AUDIO_RESOURCES + audioName);
            examQuestionDTO.setAudio(audioName);
            try {
                audioFile.transferTo(new File(pathAudio.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            examQuestionDTO.setAudio(examQuestionDTO1.getAudio());
        }
        iExamQuestionService.saveExamQuestion(examQuestionDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.UPDATE_SUCCESS_MESSAGE, null, 0);
    }

    @DeleteMapping("/api/v1/examQuestion")
    public WrapperDTO<List<ExamQuestionDTO>> deleteExam(@RequestBody Long[] ids){
        iExamQuestionService.delete(ids);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.DELETE_SUCCESS_MESSAGE, null, 0);
    }

    @GetMapping("/api/v1/examQuestion/search")
    public WrapperDTO<List<ExamQuestionDTO>> getSearchExam(@RequestParam("id") Long id,
                                                                     @RequestParam(value = "keyword", required = false) String keyword){
        if(keyword.equals(""))
            return new WrapperDTO<>(ServiceCode.ERROR_CODE, "Must enter at least 1 character", null, 0);
        List<ExamQuestionDTO> examQuestionDTOS = iExamQuestionService.searching(keyword, id);
        if(examQuestionDTOS.isEmpty())
            return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.NOT_FOUND_MESSAGE, null, 0);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.SEARCH_SUCCESS_MESSAGE, iExamQuestionService.searching(keyword, id), 0);
    }

    @GetMapping("/api/v1/listExamQuestion")
    public WrapperDTO<List<ExamQuestionDTO>> getListExamQuestion(@RequestParam("exam_id") Long examId,
                                                                       @RequestParam("index") int index){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iExamQuestionService.getListExamQuestion(examId, index), 0);
    }

    @GetMapping("/api/v1/examQuestionAll")
    public WrapperDTO<List<ExamQuestionDTO>> getExam( @RequestParam("exam_id") Long examId){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iExamQuestionService.findAllByExamId(examId), 0);
    }
}
