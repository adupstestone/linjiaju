package com.linjiaju.ocean.sys.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Created by Administrator on 14-3-28.
 */
@Controller
public class BaseController {
    @RequestMapping(value = "/error{errorPageId}.html", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String toError(@PathVariable("errorPageId") int id) throws Exception {
        String errorView;
        switch (id) {
            case 1:
                errorView = "404";
                break;
            case 2:
                errorView = "500";
                break;
            default:
                errorView = "error";
                break;
        }
        return errorView;
    }
}
