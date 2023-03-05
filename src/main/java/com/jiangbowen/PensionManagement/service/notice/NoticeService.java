package com.jiangbowen.PensionManagement.service.notice;

import com.jiangbowen.PensionManagement.entity.Notice;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public interface NoticeService {
    ArrayList<Notice> getAll();
    Integer Del(Integer id);
    Integer Add(Notice notice);
    Integer Update(Notice notice);

    Notice getNoticeById(Integer id);
}
