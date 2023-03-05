package com.jiangbowen.PensionManagement.service.user.impl;

import com.jiangbowen.PensionManagement.dao.user.UserDao;
import com.jiangbowen.PensionManagement.entity.Admin;
import com.jiangbowen.PensionManagement.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public Integer AdminUpdate(Admin admin) {
        return userDao.AdminUpdate(admin);
    }
    @Override
    public Admin getAdminById(String userid, String password) {
        return userDao.getAdminById(userid,password);
    }
}
