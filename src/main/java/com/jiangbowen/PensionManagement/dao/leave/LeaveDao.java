package com.jiangbowen.PensionManagement.dao.leave;

import com.jiangbowen.PensionManagement.entity.Leave;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface LeaveDao {
    ArrayList<Leave> getAll();
    Integer Del(Integer id);
    Integer Add(Leave leave);
    Integer Update(Leave leave);
    Leave getLeaveById(Integer id);
}
