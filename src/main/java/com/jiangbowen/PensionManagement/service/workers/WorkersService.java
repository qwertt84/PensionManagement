package com.jiangbowen.PensionManagement.service.workers;

import com.jiangbowen.PensionManagement.entity.Workers;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface WorkersService {
    ArrayList<Workers> getAll();

    Workers getWorkersById(Integer id);

    Integer Add(Workers workers);

    Integer Del(Integer id);

    Integer Update(Workers workers);
}
