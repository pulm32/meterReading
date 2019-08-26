package meterReading.biz;

import meterReading.dao.MeterDao;
import meterReading.entity.Collect;
import meterReading.entity.MeterLog;

import java.util.List;

public class MeterBiz {
    MeterDao meterDao=new MeterDao();

    //查询当前示数
    public float getDisplay(int building,String door,int type){return meterDao.getDisplay(building,door,type);}

    //按查询楼和门牌号查询
    public List<MeterLog> getMeterByBuildingandDoor(int building, String door,int type){
        return meterDao.getMeterByBuildingandDoor(building,door,type);
    }

    //按用户id查询
    public List<MeterLog> getMeterByUserId(String id,int type){return meterDao.getMeterByUserId(id,type);}

    //统计某一楼的示数
    public List<Collect> getAllByBuild(int building, int type){return meterDao.getAllByBuild(building,type);}

    //统计小区的示数
    public List<Collect> getAll(int type){return meterDao.getAll(type);}


}

