package com.jiangbowen.PensionManagement.entity;

import lombok.Data;

@Data
public class Message<T> {
   private Integer status;
   private T message;

/*    private Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public T getMessage() {
        return message;
    }

    public void setMessage(T message) {
        this.message = message;
    }*/
}
