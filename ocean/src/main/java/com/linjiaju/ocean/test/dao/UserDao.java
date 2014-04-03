package com.linjiaju.ocean.test.dao;

import com.linjiaju.ocean.test.entity.User;

/**
 * Created by Administrator on 14-3-14.
 */
public interface UserDao {
    public User findUserUnique(Long pk) throws Exception;
}
