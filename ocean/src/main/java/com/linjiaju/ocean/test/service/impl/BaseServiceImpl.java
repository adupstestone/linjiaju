package com.linjiaju.ocean.test.service.impl;

import com.linjiaju.ocean.test.dao.BaseDao;
import com.linjiaju.ocean.test.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 14-3-14.
 */
@Service
public class BaseServiceImpl<T, PK> implements BaseService<T, PK> {
    @Resource
    private BaseDao<T, PK> baseDao;

    @Override
    public T findUnique(PK pk) throws Exception {
        return baseDao.findUnique(pk);
    }

    @Override
    public List<T> findAll() throws Exception {
        return baseDao.findAll();
    }

    @Override
    public List<T> findByCondition(T condition) throws Exception {
        return findByCondition(condition);
    }

    @Override
    public void save(T t) throws Exception {
        save(t);
    }

    @Override
    public void update(T t) throws Exception {
        update(t);
    }

    @Override
    public void delete(T t) throws Exception {
        delete(t);
    }

    @Override
    public void deleteBatch(String pks) throws Exception {
        deleteBatch(pks);
    }
}
