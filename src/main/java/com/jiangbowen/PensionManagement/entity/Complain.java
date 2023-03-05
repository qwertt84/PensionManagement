package com.jiangbowen.PensionManagement.entity;

import lombok.Data;

import java.sql.Date;
@Data
public class Complain {
    private Integer id;//投诉id
    private String type;//投诉类型
    private String data;//投诉内容
    private Date create_time;//更新时间
}
