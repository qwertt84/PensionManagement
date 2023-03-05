package com.jiangbowen.PensionManagement.dao.user;

import com.jiangbowen.PensionManagement.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    Integer AdminUpdate(Admin admin);
    Admin getAdminById(@Param("userid")String id, @Param("password")String password);
}
