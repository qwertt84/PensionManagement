package com.jiangbowen.PensionManagement.dao.workers;

import com.jiangbowen.PensionManagement.entity.Workers;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface WorkersDao {
    ArrayList<Workers> getAll();
    Integer Add(Workers workers);
    Integer Del(Integer id);
    Integer Update(Workers workers);
    Workers getWorkersById(Integer id);
}
