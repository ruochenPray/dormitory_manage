package com.cn.ruochen.dormitory.service;

import com.cn.ruochen.dormitory.javaBean.pojo.Admin;
import com.cn.ruochen.dormitory.javaBean.pojo.User;

import java.util.List;

public interface Dormitory_Service {
    boolean register(Admin admin);

    boolean isExistByAdminName(String adminName);

    Admin login(Admin admin);

    boolean addUser(User user);

    List<User> userList();

    boolean isExistByBedNumber(int bedNumber);

    boolean isExistByUserId(String userId);

    User getUserById(int id);

    boolean updateUser(User user);

    boolean deleteUser(int id);

    List<User> getUserByName(String name);
}
