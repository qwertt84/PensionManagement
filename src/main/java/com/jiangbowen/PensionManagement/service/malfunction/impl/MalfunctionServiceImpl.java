package com.jiangbowen.PensionManagement.service.malfunction.impl;

import com.jiangbowen.PensionManagement.dao.malfunction.MalfunctionDao;
import com.jiangbowen.PensionManagement.entity.Malfunction;
import com.jiangbowen.PensionManagement.service.malfunction.MalfunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class MalfunctionServiceImpl implements MalfunctionService {
    @Autowired
    private MalfunctionDao malfunctionDao;
    @Override
    public ArrayList<Malfunction> getAll() {
        return malfunctionDao.getAll();
    }

    @Override
    public Integer Del(Integer id) {
        return malfunctionDao.Del(id);
    }

    @Override
    public Integer Add(Malfunction malfunction) {
        return malfunctionDao.Add(malfunction);
    }

    @Override
    public Integer Update(Malfunction malfunction) {
        return malfunctionDao.Update(malfunction);
    }

    @Override
    public Malfunction getMalfunctionById(Integer id) {
        return malfunctionDao.getMalfunctionById(id);
    }
}
