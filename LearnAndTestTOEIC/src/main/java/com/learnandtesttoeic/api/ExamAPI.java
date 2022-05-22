package com.learnandtesttoeic.api;

import com.learnandtesttoeic.constant.ServiceCode;
import com.learnandtesttoeic.dto.ExamDTO;
import com.learnandtesttoeic.dto.WrapperDTO;
import com.learnandtesttoeic.service.IExamService;
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
public class ExamAPI {
    private static final String IMAGE_RESOURCES = "/resources/file/images/exam/";
    @Autowired
    private HttpServletRequest request;

    @Autowired
    IExamService iExamService;

    @GetMapping("/api/v1/exam")
    public WrapperDTO<List<ExamDTO>> getExam(@RequestParam("page") int page,
                                             @RequestParam("per_page") int perPage){
        Pageable pageable = PageRequest.of(page - 1, perPage);
        int totalPage = (int) Math.ceil((double)iExamService.count() / perPage);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, iExamService.findAll(pageable), totalPage);
    }

    @PostMapping("/api/v1/exam")
    public WrapperDTO<ExamDTO> createExam(@RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                     @ModelAttribute ExamDTO examDTO){
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            examDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            examDTO.setImage("");
        }
        iExamService.saveExam(examDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, null, 0);
    }

    @PutMapping("/api/v1/exam")
    public WrapperDTO<ExamDTO> updateExam(@RequestParam("id") Long id,
                                                     @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                     @ModelAttribute ExamDTO examDTO){
        ExamDTO examDTO1 = iExamService.findById(id);
        examDTO.setId(id);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + IMAGE_RESOURCES + imageName);
            examDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            examDTO.setImage(examDTO1.getImage());
        }
        iExamService.saveExam(examDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.UPDATE_SUCCESS_MESSAGE, null, 0);
    }

    @GetMapping("/api/v1/examById")
    public WrapperDTO<ExamDTO> getAExam(@RequestParam("id") Long id){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iExamService.findById(id), 0);
    }

    @DeleteMapping("/api/v1/exam")
    public WrapperDTO<ExamDTO> deleteExam(@RequestBody Long id){
        iExamService.delete(id);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.DELETE_SUCCESS_MESSAGE, null, 0);
    }
}
