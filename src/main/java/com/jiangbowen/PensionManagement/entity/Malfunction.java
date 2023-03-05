package com.jiangbowen.PensionManagement.entity;

import lombok.Data;

import java.sql.Date;
@Data
public class Malfunction {

        private Integer id;//公告id
        private String type;//公告类型
        private String data;//公告内容
        private Date create_time;//更新时间
}
