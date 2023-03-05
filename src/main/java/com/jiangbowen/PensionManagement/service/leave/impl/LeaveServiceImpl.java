package com.jiangbowen.PensionManagement.service.leave.impl;

import com.jiangbowen.PensionManagement.dao.leave.LeaveDao;
import com.jiangbowen.PensionManagement.entity.Leave;
import com.jiangbowen.PensionManagement.service.leave.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class LeaveServiceImpl implements LeaveService {
    @Autowired
    private LeaveDao leaveDao;
    @Override
    public ArrayList<Leave> getAll() {
        return leaveDao.getAll();
    }

    @Override
    public Integer Del(Integer id) {
        return leaveDao.Del(id);
    }

    @Override
    public Integer Add(Leave leave) {
        return leaveDao.Add(leave);
    }

    @Override
    public Integer Update(Leave leave) {
        return leaveDao.Update(leave);
    }

    @Override
    public Leave getLeaveById(Integer id) {
        return leaveDao.getLeaveById(id);
    }
}
