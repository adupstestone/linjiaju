package com.linjiaju.ocean.test.entity;

/**
 * Created by Administrator on 14-3-14.
 */
public class User {
    private Long userId; // 用户ID主键
    private String userName; // 用户姓名
    private String idCard; // 身份证

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

}
