package com.jiangbowen.PensionManagement.service.family;

import com.jiangbowen.PensionManagement.entity.Family;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface FamilyService {
    ArrayList<Family> getAll();

    Family getFamilyById(Integer id);

    Integer Add(Family family);

    Integer Del(Integer id);

    Integer Update(Family family);
}
