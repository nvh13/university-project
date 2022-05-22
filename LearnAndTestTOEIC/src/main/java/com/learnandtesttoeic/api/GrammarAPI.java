package com.learnandtesttoeic.api;

import com.learnandtesttoeic.constant.ServiceCode;
import com.learnandtesttoeic.dto.GrammarDTO;
import com.learnandtesttoeic.dto.WrapperDTO;
import com.learnandtesttoeic.service.IGrammarService;
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
public class GrammarAPI {
    private static final String RESOURCES = "/resources/file/images/grammar/";
    @Autowired
    private HttpServletRequest request;
    @Autowired
    IGrammarService iGrammarService;

    @GetMapping("/api/v1/grammar")
    public WrapperDTO<List<GrammarDTO>> getGrammar(@RequestParam("page") int page,
                                                   @RequestParam("per_page") int perPage){

        Pageable pageable = PageRequest.of(page - 1, perPage);
        int totalPage = (int) Math.ceil((double)iGrammarService.count() / perPage);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iGrammarService.getNameAndId(pageable), totalPage);
    }

    @GetMapping("/api/v1/grammarDetail")
    public WrapperDTO<GrammarDTO> getGrammarDetail(@RequestParam("id") Long id){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, iGrammarService.findById(id), 0);
    }

    @PostMapping("/api/v1/grammar")
    public WrapperDTO<List<GrammarDTO>> createGrammar(  @RequestParam(value = "imageOutsideFile", required = false) MultipartFile imageOutsideFile,
                                                                  @RequestParam(value = "imageInsideFile", required = false) MultipartFile imageInsideFile,
                                                                  @ModelAttribute GrammarDTO grammarDTO){
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageOutsideFile != null){
            String imageOutsideName = imageOutsideFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + RESOURCES + imageOutsideName);
            grammarDTO.setImageOutside(imageOutsideName);
            try {
                imageOutsideFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            grammarDTO.setImageOutside("");
        }
        if(imageInsideFile != null){
            String imageInsideName = imageInsideFile.getOriginalFilename();
            Path pathAudio = Paths.get(rootDirectory + RESOURCES + imageInsideName);
            grammarDTO.setImageInside(imageInsideName);
            try {
                imageInsideFile.transferTo(new File(pathAudio.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            grammarDTO.setImageInside("");
        }
        iGrammarService.saveGrammar(grammarDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, null, 0);
    }

    @PutMapping("/api/v1/grammar")
    public WrapperDTO<List<GrammarDTO>> updateGrammar(@RequestParam("id") Long id,
                                                                  @RequestParam(value = "imageOutsideFile", required = false) MultipartFile imageOutsideFile,
                                                                  @RequestParam(value = "imageInsideFile", required = false) MultipartFile imageInsideFile,
                                                                  @ModelAttribute GrammarDTO grammarDTO){
        GrammarDTO grammarDTO1 = iGrammarService.findById(id);
        grammarDTO1.setId(id);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageOutsideFile != null){
            String imageOutsideName = imageOutsideFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + RESOURCES + imageOutsideName);
            grammarDTO.setImageOutside(imageOutsideName);
            try {
                imageOutsideFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            grammarDTO.setImageOutside(grammarDTO1.getImageOutside());
        }
        if(imageInsideFile != null){
            String imageInsideName = imageInsideFile.getOriginalFilename();
            Path pathAudio = Paths.get(rootDirectory + RESOURCES + imageInsideName);
            grammarDTO.setImageInside(imageInsideName);
            try {
                imageInsideFile.transferTo(new File(pathAudio.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            grammarDTO.setImageInside(grammarDTO1.getImageInside());
        }
        iGrammarService.saveGrammar(grammarDTO);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.UPDATE_SUCCESS_MESSAGE, null, 0);
    }

    @DeleteMapping("/api/v1/grammar")
    public WrapperDTO<List<GrammarDTO>> deleteGrammar(@RequestBody Long id){
        iGrammarService.delete(id);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.DELETE_SUCCESS_MESSAGE, null, 0);
    }
}
