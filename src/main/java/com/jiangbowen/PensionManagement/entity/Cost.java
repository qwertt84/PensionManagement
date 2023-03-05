package com.jiangbowen.PensionManagement.entity;

import lombok.Data;

import java.sql.Date;
@Data
public class Cost {
        private Integer id;//id
        private Integer olderid;//olderid
        private String name;//姓名
        private double cost;//费用
        private Date create_time;//更新时间

}
