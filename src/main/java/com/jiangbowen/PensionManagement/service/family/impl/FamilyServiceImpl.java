package com.jiangbowen.PensionManagement.service.family.impl;

import com.jiangbowen.PensionManagement.dao.family.FamilyDao;
import com.jiangbowen.PensionManagement.entity.Family;
import com.jiangbowen.PensionManagement.service.family.FamilyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class FamilyServiceImpl implements FamilyService {
    @Autowired
    private FamilyDao familyDao;
    public ArrayList<Family> getAll(){
       return familyDao.getAll();
    }

    @Override
    public Family getFamilyById(Integer id) {
        return familyDao.getFamilyById(id);
    }

    @Override
    public Integer Add(Family family) {
        return familyDao.Add(family);
    }

    @Override
    public Integer Del(Integer id) {
        return familyDao.Del(id);
    }

    @Override
    public Integer Update(Family family) {
        return familyDao.Update(family);
    }
}
