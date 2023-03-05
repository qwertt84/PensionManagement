package com.jiangbowen.PensionManagement.service.older;


import com.jiangbowen.PensionManagement.entity.Older;
import com.jiangbowen.PensionManagement.entity.OlderStatus;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public interface OlderStatusService {
    ArrayList<OlderStatus> getAll();
    OlderStatus getOlderStatusById(Integer id);
    Integer Add(OlderStatus olderStatus);
    Integer Del(Integer id);
    Integer Update(OlderStatus olderStatus);
}
