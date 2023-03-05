package com.jiangbowen.PensionManagement.service.malfunction;

import com.jiangbowen.PensionManagement.entity.Malfunction;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface MalfunctionService {
    ArrayList<Malfunction> getAll();
    Integer Del(Integer id);
    Integer Add(Malfunction malfunction);
    Integer Update(Malfunction malfunction);
    Malfunction getMalfunctionById(Integer id);
}
