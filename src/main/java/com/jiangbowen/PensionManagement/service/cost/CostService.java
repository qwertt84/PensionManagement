package com.jiangbowen.PensionManagement.service.cost;

import com.jiangbowen.PensionManagement.entity.Cost;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface CostService {
    ArrayList<Cost> getAll();
    Integer Del(Integer id);
    Integer Add(Cost cost);
    Integer Update(Cost cost);
    Cost getCostById(Integer id);
}
