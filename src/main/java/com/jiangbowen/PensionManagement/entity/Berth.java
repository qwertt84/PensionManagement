package com.jiangbowen.PensionManagement.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class Berth {
    private Integer id;//id
    private Integer olderid;//olderid
    private String name;//姓名
    private String ridgepole ;//栋
    private String floor ;//楼
    private String  building ;//号
    private String berth;//床位号
    private Date create_time;//更新时间
}
