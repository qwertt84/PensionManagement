package com.jiangbowen.PensionManagement.dao.older;

import com.jiangbowen.PensionManagement.entity.Older;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface OlderDao {
    ArrayList<Older> getAll();
    Integer Add(Older older);
    Integer Del(Integer id);
    Integer Update(Older older);
    Older getOlderById(Integer id);
}
