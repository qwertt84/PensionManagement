package com.jiangbowen.PensionManagement.service.older;

import com.jiangbowen.PensionManagement.entity.Older;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public interface OlderService {
    ArrayList<Older> getAll();

    Older getOlderById(Integer id);

    Integer Add(Older older);

    Integer Del(Integer id);

    Integer Update(Older older);

    ArrayList<Older>  getOlderByUId(Integer familyid);
}
