package com.jiangbowen.PensionManagement.dao.complain;

import com.jiangbowen.PensionManagement.entity.Complain;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ComplainDao {
    ArrayList<Complain> getAll();
    Integer Del(Integer id);
    Integer Add(Complain complain);
    Integer Update(Complain complain);
    Complain getComplainById(Integer id);
}
