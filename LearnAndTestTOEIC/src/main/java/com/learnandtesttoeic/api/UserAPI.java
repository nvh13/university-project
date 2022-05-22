package com.learnandtesttoeic.api;

import com.learnandtesttoeic.constant.ServiceCode;
import com.learnandtesttoeic.dto.*;
import com.learnandtesttoeic.service.impl.UserService;
import com.learnandtesttoeic.until.MyValidateException;
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
public class UserAPI {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    UserService userService;

    @GetMapping("/api/v1/user")
    public WrapperDTO<List<UserDTO>> getUsers(@RequestParam("page") int page,
                                                               @RequestParam("per_page") int perPage){
        Pageable pageable = PageRequest.of(page - 1, perPage);
        int totalPage = (int) Math.ceil((double)userService.count() / perPage);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, userService.findAll(pageable), totalPage);
    }

    @PostMapping("/api/v1/user")
    public WrapperDTO<UserDTO> createUser(@RequestBody UserDTO userDTO){
        try{
            userService.add(userDTO);
        }
        catch (MyValidateException ex){
            return new WrapperDTO<>(ServiceCode.ERROR_CODE, ex.getMessage(), null, 0);
        }
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.ADD_SUCCESS_MESSAGE, null, 0);
    }

    @GetMapping("/api/v1/userById")
    public WrapperDTO<UserDTO> getUser(@RequestParam("id") Long id){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, userService.findById(id), 0);
    }

    @PutMapping("/api/v1/user")
    public WrapperDTO<List<UserDTO>> updateUser(@RequestParam("id") Long id,
                                                                  @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                                                  @ModelAttribute UserDTO userDTO){
        userDTO.setId(id);
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        if(imageFile != null){
            String imageName = imageFile.getOriginalFilename();
            Path pathImage = Paths.get(rootDirectory + "/resources/file/images/avatar_user/" + imageName);
            userDTO.setImage(imageName);
            try {
                imageFile.transferTo(new File(pathImage.toString()));
            } catch (Exception e) {
                return new WrapperDTO<>(ServiceCode.ERROR_CODE, ServiceCode.ERROR_MESSAGE, null, 0);
            }
        }else{
            userDTO.setImage(userService.findById(id).getImage());
        }
        try{
            userService.update(userDTO);
        }
        catch (MyValidateException ex){
            return new WrapperDTO<>(ServiceCode.ERROR_CODE, ex.getMessage(), null, 0);
        }
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.UPDATE_SUCCESS_MESSAGE, null, 0);
    }

    @GetMapping("/api/v1/resultByUserName")
    public WrapperDTO<List<ResultDTO>> getResultByUserName(@RequestParam("user_name") String userName){
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.GET_SUCCESS_MESSAGE, userService.findResultByUsername(userName), 0);
    }

    @PutMapping("/api/v1/userStatus")
    public WrapperDTO<List<UserDTO>> updateUserStatus(@RequestBody Long[] ids){
        userService.changeStatus(ids);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, "CHANGE_STATUS_SUCCESS!", null, 0);
    }

    @GetMapping("/api/v1/user/search")
    public WrapperDTO<List<UserDTO>> getSearchUser(@RequestParam(value = "keyword", required = false) String keyword){
        if(keyword.equals(""))
            return new WrapperDTO<>(ServiceCode.ERROR_CODE, "Must enter at least 1 character", null, 0);
        List<UserDTO> userDTOS = userService.searching(keyword);
        if(userDTOS.isEmpty())
            return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.NOT_FOUND_MESSAGE, null, 0);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.SEARCH_SUCCESS_MESSAGE, userDTOS, 0);
    }

    @GetMapping("/api/v1/user/searchByStatus")
    public WrapperDTO<List<UserDTO>> getSearchStatus(@RequestParam(value = "keyword") String keyword){
        List<UserDTO> userDTOS = userService.searchingByStatus(keyword);
        if(userDTOS.isEmpty())
            return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.NOT_FOUND_MESSAGE, null, 0);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.SEARCH_SUCCESS_MESSAGE, userDTOS, 0);
    }

    @GetMapping("/api/v1/user/searchByRole")
    public WrapperDTO<List<UserDTO>> getSearchRole(@RequestParam(value = "keyword") String keyword){
        List<UserDTO> userDTOS = userService.searchingByRole(keyword);
        if(userDTOS.isEmpty())
            return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.NOT_FOUND_MESSAGE, null, 0);
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, ServiceCode.SEARCH_SUCCESS_MESSAGE, userDTOS, 0);
    }

    @PutMapping("/api/v1/changePassword")
    public WrapperDTO<List<UserDTO>> changePassword(@RequestParam("id") Long id,
                                                    @RequestBody PasswordDTO passwordDTO){
        try{
            userService.changePassword(id, passwordDTO);
        }
        catch (MyValidateException ex){
            return new WrapperDTO<>(ServiceCode.ERROR_CODE, ex.getMessage(), null, 0);
        }
        return new WrapperDTO<>(ServiceCode.SUCCESS_CODE, "CHANGE_PASSWORD_SUCCESS!", null, 0);
    }
}
