package com.jiangbowen.PensionManagement.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class Leave {
    private Integer id;//id
    private Integer workersid;//id
    private String name;//姓名
    private String cause;//请假理由
    private Double leave_time;//请假时间
    private Date create_time;//更新时间
}
