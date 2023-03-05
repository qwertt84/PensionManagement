package com.jiangbowen.PensionManagement.entity;

import lombok.Data;

import java.sql.Date;
@Data
public class OlderStatus {
    private Integer id;//id
    private Integer olderid;//olderid
    private String name;//姓名
    private Double height;//身高
    private Double weight;//体重
    private String blood_type;//血型
    private String allergy;//过敏
    private Double heart_rate;//心率
    private Double blood_pressure;//血压
    private Double blood_sugar;//血糖
    private String smoke;//吸烟
    private Date create_time;//更新时间
}
