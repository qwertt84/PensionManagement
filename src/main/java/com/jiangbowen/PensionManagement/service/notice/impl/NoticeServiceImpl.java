package com.jiangbowen.PensionManagement.service.notice.impl;

import com.jiangbowen.PensionManagement.dao.notice.NoticeDao;
import com.jiangbowen.PensionManagement.entity.Notice;
import com.jiangbowen.PensionManagement.service.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeDao noticeDao;
    @Override
    public ArrayList<Notice> getAll() {
        return noticeDao.getAll();
    }

    @Override
    public Integer Del(Integer id) {
        return noticeDao.Del(id);
    }

    @Override
    public Integer Add(Notice notice) {
        return noticeDao.Add(notice);
    }

    @Override
    public Integer Update(Notice notice) {
        return noticeDao.Update(notice);
    }

    @Override
    public Notice getNoticeById(Integer id) {
        return noticeDao.getNoticeById(id);
    }
}
