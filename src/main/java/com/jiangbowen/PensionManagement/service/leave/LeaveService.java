package com.jiangbowen.PensionManagement.service.leave;

import com.jiangbowen.PensionManagement.entity.Leave;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface LeaveService {
    ArrayList<Leave> getAll();
    Integer Del(Integer id);
    Integer Add(Leave leave);
    Integer Update(Leave leave);
    Leave getLeaveById(Integer id);
}
