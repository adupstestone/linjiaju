package com.linjiaju.ocean.test.dao;

import java.util.List;

/**
 * Created by Administrator on 14-3-14.
 */
public interface BaseDao<T, Pk> {
    public T findUnique(Pk pk) throws Exception;

    public List<T> findAll() throws Exception;

    public List<T> findByCondition(T condition) throws Exception;

    public void save(T t) throws Exception;

    public void update(T t) throws Exception;

    public void delete(T t) throws Exception;

    public void deleteBatch(String pks) throws Exception;
}
