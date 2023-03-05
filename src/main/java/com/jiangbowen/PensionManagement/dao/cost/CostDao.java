package com.jiangbowen.PensionManagement.dao.cost;

import com.jiangbowen.PensionManagement.entity.Cost;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface CostDao {
    ArrayList<Cost> getAll();
    Integer Del(Integer id);
    Integer Add(Cost cost);
    Integer Update(Cost cost);
    Cost getCostById(Integer id);
}
