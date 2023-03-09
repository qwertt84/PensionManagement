package com.jiangbowen.PensionManagement.service.salary;

import com.jiangbowen.PensionManagement.entity.Salary;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface SalaryService {
    ArrayList<Salary> getAll();

    Salary getSalaryById(Integer id);

    Integer Add(Salary salary);

    Integer Del(Integer id);

    Integer Update(Salary salary);

    Salary getSalaryByUId(Integer workersid);
    }
