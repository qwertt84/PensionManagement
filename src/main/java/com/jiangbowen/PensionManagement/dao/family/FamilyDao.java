package com.jiangbowen.PensionManagement.dao.family;

import com.jiangbowen.PensionManagement.entity.Family;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface FamilyDao {
    ArrayList<Family> getAll();
    Integer Add(Family family);
    Integer Del(Integer id);
    Integer Update(Family family);
    Family getFamilyById(Integer id);
}
