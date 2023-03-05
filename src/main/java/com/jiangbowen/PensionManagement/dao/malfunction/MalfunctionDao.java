package com.jiangbowen.PensionManagement.dao.malfunction;

import com.jiangbowen.PensionManagement.entity.Malfunction;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface MalfunctionDao {
    ArrayList<Malfunction> getAll();
    Integer Del(Integer id);
    Integer Add(Malfunction malfunction);
    Integer Update(Malfunction malfunction);
    Malfunction getMalfunctionById(Integer id);
}
