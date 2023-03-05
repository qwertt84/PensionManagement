package com.jiangbowen.PensionManagement.service.older.impl;

import com.jiangbowen.PensionManagement.dao.older.OlderDao;
import com.jiangbowen.PensionManagement.entity.Older;
import com.jiangbowen.PensionManagement.service.older.OlderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class OlderServiceImpl implements OlderService {
    @Autowired
    private OlderDao olderDao;
    public ArrayList<Older> getAll(){
       return olderDao.getAll();
    }

    @Override
    public Older getOlderById(Integer id) {
        return olderDao.getOlderById(id);
    }

    @Override
    public Integer Add(Older older) {
        return olderDao.Add(older);
    }

    @Override
    public Integer Del(Integer id) {
        return olderDao.Del(id);
    }

    @Override
    public Integer Update(Older older) {
        return olderDao.Update(older);
    }
}
