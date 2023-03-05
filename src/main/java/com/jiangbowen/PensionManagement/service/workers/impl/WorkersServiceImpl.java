package com.jiangbowen.PensionManagement.service.workers.impl;

import com.jiangbowen.PensionManagement.dao.workers.WorkersDao;
import com.jiangbowen.PensionManagement.entity.Workers;
import com.jiangbowen.PensionManagement.service.workers.WorkersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class WorkersServiceImpl implements WorkersService {
    @Autowired
    private WorkersDao workersDao;
    public ArrayList<Workers> getAll(){
       return workersDao.getAll();
    }

    @Override
    public Workers getWorkersById(Integer id) {
        return workersDao.getWorkersById(id);
    }

    @Override
    public Integer Add(Workers workers) {
        return workersDao.Add(workers);
    }

    @Override
    public Integer Del(Integer id) {
        return workersDao.Del(id);
    }

    @Override
    public Integer Update(Workers workers) {
        return workersDao.Update(workers);
    }
}
