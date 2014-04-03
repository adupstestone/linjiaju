package com.linjiaju.ocean.test.controller;

import com.linjiaju.ocean.test.entity.User;
import com.linjiaju.ocean.test.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * Created by Administrator on 14-3-14.
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public User findUserById(@PathVariable("id") Long id) throws Exception {
        return userService.findUserUnique(id);
    }

    @RequestMapping(value = "/print/{id}", method = RequestMethod.GET)
    public void printUserById(@PathVariable("id") Long id) throws Exception {
        userService.printUserInfoByPk(id);
    }

    @RequestMapping(value = "/index/", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String toIndex() throws Exception {
        return "test";
    }
}
