package com.jiangbowen.PensionManagement.service.older.impl;

import com.jiangbowen.PensionManagement.dao.older.OlderStatusDao;
import com.jiangbowen.PensionManagement.entity.OlderStatus;
import com.jiangbowen.PensionManagement.service.older.OlderStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public class OlderStatusServiceImpl implements OlderStatusService {
    @Autowired
    private OlderStatusDao olderStatusDao;
    @Override
    public ArrayList<OlderStatus> getAll() {
        return olderStatusDao.getAll();
    }

    @Override
    public OlderStatus getOlderStatusById(Integer id) {
        return olderStatusDao.getOlderStatusById(id);
    }

    @Override
    public Integer Add(OlderStatus olderStatus) {
        return olderStatusDao.Add(olderStatus);
    }

    @Override
    public Integer Del(Integer id) {
        return olderStatusDao.Del(id);
    }

    @Override
    public Integer Update(OlderStatus olderStatus) {
        return olderStatusDao.Update(olderStatus);
    }
}
