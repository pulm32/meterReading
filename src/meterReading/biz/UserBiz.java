package meterReading.biz;
import meterReading.entity.*;
import meterReading.dao.UserDao;

import java.util.List;

public class UserBiz  {
    UserDao userDao = new UserDao();

    // 查询用户列表
    public List<UserInfo> listUser() {
        return userDao.listUser();
    }

    //新建
    public int insert(UserInfo userInfo){return  userDao.insert(userInfo); }

    //保存一条信息
    public int save(UserInfo userInfo){return userDao.save(userInfo);}

    //按楼号查找用户信息
    public List<UserInfo> getUserByBuilding(int building){return userDao.getUserByBuilding(building);}
}
