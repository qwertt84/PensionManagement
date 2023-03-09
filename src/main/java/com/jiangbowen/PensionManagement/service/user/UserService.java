package com.jiangbowen.PensionManagement.service.user;

import com.jiangbowen.PensionManagement.entity.Admin;
import com.jiangbowen.PensionManagement.entity.Family;
import com.jiangbowen.PensionManagement.entity.Workers;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    Integer FamilyUpdate(Family family);
    Family getFamilyById(String userid, String password);
    Integer WorkersUpdate(Workers workers);
    Workers getWorkersById(String userid, String password);
    Integer AdminUpdate(Admin admin);
    Admin getAdminById(String userid, String password);
}
