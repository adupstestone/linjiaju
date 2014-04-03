package com.linjiaju.ocean.test.service;

import com.linjiaju.ocean.test.entity.User;

/**
 * Created by Administrator on 14-3-14.
 */
public interface UserService {
    public void printUserInfoByPk(Long pk) throws Exception;

    public User findUserUnique(Long pk) throws Exception;
}
