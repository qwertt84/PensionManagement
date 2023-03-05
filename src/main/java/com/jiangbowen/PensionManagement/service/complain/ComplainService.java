package com.jiangbowen.PensionManagement.service.complain;

import com.jiangbowen.PensionManagement.entity.Complain;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface ComplainService {
    ArrayList<Complain> getAll();
    Integer Del(Integer id);
    Integer Add(Complain complain);
    Integer Update(Complain complain);
    Complain getComplainById(Integer id);
}
