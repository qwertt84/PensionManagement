package com.jiangbowen.PensionManagement.dao.berth;

import com.jiangbowen.PensionManagement.entity.Berth;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;

@Repository
public interface BerthDao {
    ArrayList<Berth> getAll();
    Integer Del(Integer id);
    Integer Add(Berth berth);
    Integer Update(Berth berth);
    Berth getBerthById(Integer id);
}
