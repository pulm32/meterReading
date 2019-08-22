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

}
