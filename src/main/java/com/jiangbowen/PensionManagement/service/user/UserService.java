package com.jiangbowen.PensionManagement.service.user;

import com.jiangbowen.PensionManagement.entity.Admin;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    Integer AdminUpdate(Admin admin);
    Admin getAdminById(String userid, String password);
}
