package com.jiangbowen.PensionManagement.dao.notice;

import com.jiangbowen.PensionManagement.entity.Notice;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
@Repository
public interface NoticeDao {
    ArrayList<Notice> getAll();
    Integer Del(Integer id);
    Integer Add(Notice notice);
    Integer Update(Notice notice);
    Notice getNoticeById(Integer id);
}
