package com.jiangbowen.PensionManagement.service.cost.impl;

import com.jiangbowen.PensionManagement.dao.cost.CostDao;
import com.jiangbowen.PensionManagement.entity.Cost;
import com.jiangbowen.PensionManagement.service.cost.CostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CostServiceImpl implements CostService {
    @Autowired
    private CostDao costDao;
    @Override
    public ArrayList<Cost> getAll() {
        return costDao.getAll();
    }

    @Override
    public Integer Del(Integer id) {
        return costDao.Del(id);
    }

    @Override
    public Integer Add(Cost cost) {
        return costDao.Add(cost);
    }

    @Override
    public Integer Update(Cost cost) {
        return costDao.Update(cost);
    }

    @Override
    public Cost getCostById(Integer id) {
        return costDao.getCostById(id);
    }
}
