package com.jiangbowen.PensionManagement.dao.salary;

import com.jiangbowen.PensionManagement.entity.Salary;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface SalaryDao {
    ArrayList<Salary> getAll();
    Integer Add(Salary salary);
    Integer Del(Integer id);
    Integer Update(Salary salary);
    Salary getSalaryById(Integer id);
}
