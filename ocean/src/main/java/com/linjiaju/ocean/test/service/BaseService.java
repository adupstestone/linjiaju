package com.linjiaju.ocean.test.service;

import java.util.List;

/**
 * Created by Administrator on 14-3-14.
 * 基础服务类提供简单增删改查
 */
public interface BaseService<T, PK> {
    public T findUnique(PK pk) throws Exception;

    public List<T> findAll() throws Exception;

    public List<T> findByCondition(T condition) throws Exception;

    public void save(T t) throws Exception;

    public void update(T t) throws Exception;

    public void delete(T t) throws Exception;

    public void deleteBatch(String pks) throws Exception;
}
