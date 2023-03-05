package com.jiangbowen.PensionManagement.service.berth.impl;

import com.jiangbowen.PensionManagement.dao.berth.BerthDao;
import com.jiangbowen.PensionManagement.entity.Berth;
import com.jiangbowen.PensionManagement.service.berth.BerthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public class BerthServiceImpl implements BerthService {
    @Autowired
    private BerthDao berthDao;
    @Override
    public ArrayList<Berth> getAll() {
        return berthDao.getAll();
    }

    @Override
    public Integer Del(Integer id) {
        return berthDao.Del(id);
    }

    @Override
    public Integer Add(Berth berth) {
        return berthDao.Add(berth);
    }

    @Override
    public Integer Update(Berth berth) {
        return berthDao.Update(berth);
    }

    @Override
    public Berth getBerthById(Integer id) {
        return berthDao.getBerthById(id);
    }
}
