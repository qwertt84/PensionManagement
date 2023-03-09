package com.jiangbowen.PensionManagement.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class Salary {
    private Integer id;//id
    private Integer workersid;//id
    private String username;//姓名
    private Double salary;//薪资
    private Date salary_time;//发薪日期
    private Date create_time;//更新时间
}
