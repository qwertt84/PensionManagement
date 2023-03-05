package com.jiangbowen.PensionManagement.service.complain.impl;

import com.jiangbowen.PensionManagement.dao.complain.ComplainDao;
import com.jiangbowen.PensionManagement.entity.Complain;
import com.jiangbowen.PensionManagement.service.complain.ComplainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ComplainServiceImpl implements ComplainService {
    @Autowired
    private ComplainDao complainDao;
    @Override
    public ArrayList<Complain> getAll() {
        return complainDao.getAll();
    }

    @Override
    public Integer Del(Integer id) {
        return complainDao.Del(id);
    }

    @Override
    public Integer Add(Complain complain) {
        return complainDao.Add(complain);
    }

    @Override
    public Integer Update(Complain complain) {
        return complainDao.Update(complain);
    }

    @Override
    public Complain getComplainById(Integer id) {
        return complainDao.getComplainById(id);
    }
}
