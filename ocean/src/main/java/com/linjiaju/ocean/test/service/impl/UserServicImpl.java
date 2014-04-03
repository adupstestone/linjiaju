package com.linjiaju.ocean.test.service.impl;

import com.linjiaju.ocean.test.service.impl.BaseServiceImpl;
import com.linjiaju.ocean.test.dao.UserDao;
import com.linjiaju.ocean.test.entity.User;
import com.linjiaju.ocean.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 14-3-14.
 */
@Service
public class UserServicImpl extends BaseServiceImpl<User, Long> implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void printUserInfoByPk(Long pk) throws Exception {
        User user = userDao.findUserUnique(pk);
        System.out.println("编号：" + user.getUserId());
        System.out.println("姓名：" + user.getUserName());
        System.out.println("身份证：" + user.getIdCard());
    }

    @Override
    public User findUserUnique(Long pk) throws Exception {
        return userDao.findUserUnique(pk);
    }
}
