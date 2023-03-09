package com.jiangbowen.PensionManagement.dao.user;

import com.jiangbowen.PensionManagement.entity.Admin;
import com.jiangbowen.PensionManagement.entity.Family;
import com.jiangbowen.PensionManagement.entity.Workers;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    Integer AdminUpdate(Admin admin);
    Admin getAdminById(@Param("userid")String userid, @Param("password")String password);
    Integer FamilyUpdate(Family family);
    Family getFamilyById(@Param("userid")String userid, @Param("password")String password);
    Integer WorkersUpdate(Workers workers);
    Workers getWorkersById(@Param("userid")String userid, @Param("password")String password);
}
