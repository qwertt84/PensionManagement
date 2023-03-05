package com.jiangbowen.PensionManagement.service.salary.impl;

import com.jiangbowen.PensionManagement.dao.salary.SalaryDao;
import com.jiangbowen.PensionManagement.entity.Salary;
import com.jiangbowen.PensionManagement.service.salary.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class SalaryServiceImpl implements SalaryService {
    @Autowired
    private SalaryDao salaryDao;
    public ArrayList<Salary> getAll(){
       return salaryDao.getAll();
    }

    @Override
    public Salary getSalaryById(Integer id) {
        return salaryDao.getSalaryById(id);
    }

    @Override
    public Integer Add(Salary salary) {
        return salaryDao.Add(salary);
    }

    @Override
    public Integer Del(Integer id) {
        return salaryDao.Del(id);
    }

    @Override
    public Integer Update(Salary salary) {
        return salaryDao.Update(salary);
    }
}
