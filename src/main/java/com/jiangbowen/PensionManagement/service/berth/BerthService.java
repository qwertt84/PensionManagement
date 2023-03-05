package com.jiangbowen.PensionManagement.service.berth;

import com.jiangbowen.PensionManagement.entity.Berth;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public interface BerthService {
    ArrayList<Berth> getAll();
    Integer Del(Integer id);
    Integer Add(Berth berth);
    Integer Update(Berth berth);
    Berth getBerthById(Integer id);
}
