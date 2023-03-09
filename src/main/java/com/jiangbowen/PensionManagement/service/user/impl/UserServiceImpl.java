package com.jiangbowen.PensionManagement.service.user.impl;

import com.jiangbowen.PensionManagement.dao.user.UserDao;
import com.jiangbowen.PensionManagement.entity.Admin;
import com.jiangbowen.PensionManagement.entity.Family;
import com.jiangbowen.PensionManagement.entity.Workers;
import com.jiangbowen.PensionManagement.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public Integer FamilyUpdate(Family family) {
        return userDao.FamilyUpdate(family);
    }

    @Override
    public Family getFamilyById(String userid, String password) {
        return userDao.getFamilyById(userid,password);
    }

    @Override
    public Integer WorkersUpdate(Workers workers) {
        return userDao.WorkersUpdate(workers);
    }

    @Override
    public Workers getWorkersById(String userid, String password) {
        return userDao.getWorkersById(userid,password);
    }

    @Override
    public Integer AdminUpdate(Admin admin) {
        return userDao.AdminUpdate(admin);
    }
    @Override
    public Admin getAdminById(String userid, String password) {
        return userDao.getAdminById(userid,password);
    }
}
