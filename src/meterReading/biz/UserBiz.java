package meterReading.biz;
import meterReading.dao.MeterDao;
import meterReading.entity.*;
import meterReading.dao.UserDao;

import java.util.LinkedList;
import java.util.List;

public class UserBiz  {
    UserDao userDao = new UserDao();
    MeterDao meterDao = new MeterDao();

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

    public UserInfo getuserByBuildingandDoor(int building,String door){return userDao.getuserByBuildingandDoor(building,door);}

    //按id查找用户
    public UserInfo getUserById(String id){return userDao.getUserById(id);}

    //获得异常用户列表
    public List<UserInfo> geterroruser(){
        List<UserInfo> errorlist = new LinkedList<>();
        int count=userDao.getCount();
        List<UserInfo> userList = userDao.listUser();
        for(int i=0;i<count;i++){
            UserInfo userInfo=userList.get(i);
            List<MeterLog> loglist1=meterDao.getMeterByUserId(userInfo.getId(),1);
            if(loglist1.size()>=3){
                if(loglist1.get(0).getDisplay()<loglist1.get(1).getDisplay()||loglist1.get(1).getDisplay()<loglist1.get(2).getDisplay()){
                    errorlist.add(userInfo);continue;
                }
                else if(userInfo.getPermanent().equals("Y")&&loglist1.get(0).getDisplay()==loglist1.get(1).getDisplay()
                &&loglist1.get(1).getDisplay()==loglist1.get(2).getDisplay()){
                    errorlist.add(userInfo);continue;
                }
            }
            List<MeterLog> loglist2=meterDao.getMeterByUserId(userInfo.getId(),2);
            if(loglist2.size()>=3){
                if(loglist2.get(0).getDisplay()<loglist2.get(1).getDisplay()||loglist2.get(1).getDisplay()<loglist2.get(2).getDisplay()){
                    errorlist.add(userInfo);continue;
                }
                else if(userInfo.getPermanent().equals("Y")&&loglist2.get(0).getDisplay()==loglist2.get(1).getDisplay()
                        &&loglist2.get(1).getDisplay()==loglist2.get(2).getDisplay()){
                    errorlist.add(userInfo);continue;
                }
            }
            List<MeterLog> loglist3=meterDao.getMeterByUserId(userInfo.getId(),3);
            if(loglist3.size()>=3){
                if(loglist2.get(0).getDisplay()<loglist3.get(1).getDisplay()||loglist3.get(1).getDisplay()<loglist3.get(2).getDisplay()){
                    errorlist.add(userInfo);continue;
                }
                else if(userInfo.getPermanent().equals("Y")&&loglist3.get(0).getDisplay()==loglist3.get(1).getDisplay()
                        &&loglist3.get(1).getDisplay()==loglist3.get(2).getDisplay()){
                    errorlist.add(userInfo);continue;
                }
            }

        }
        return errorlist;
    }
}
