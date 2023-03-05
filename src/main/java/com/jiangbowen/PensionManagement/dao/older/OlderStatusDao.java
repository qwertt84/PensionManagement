package com.jiangbowen.PensionManagement.dao.older;

import com.jiangbowen.PensionManagement.entity.OlderStatus;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface OlderStatusDao {
    ArrayList<OlderStatus> getAll();
    OlderStatus getOlderStatusById(Integer id);
    Integer Add(OlderStatus olderStatus);
    Integer Del(Integer id);
    Integer Update(OlderStatus olderStatus);
}
