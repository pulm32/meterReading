package meterReading.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import meterReading.entity.*;


public class MeterDao extends baseDao{
    private Connection conn  = null;   // 数据库连接
    private PreparedStatement pstmt = null;   // 创建PreparedStatement对象
    private ResultSet rs    = null;   // 创建结果集对象

    //查询当前示数
    public float getDisplay(int building,String door,int type){
        float display=0;

        String sql="select (display) from meterlog,metertype,userinfo,usermeter " +
                "where meterlog.meterid=usermeter.meterid and usermeter.userid=userinfo.id and " +
                "meterlog.meterid=metertype.meterid and door='"+door+"' and building= "+building+" and type="+type+" order by date desc";
        try{
            conn=super.getConn();
            pstmt = conn.prepareStatement(sql);
            rs    = pstmt.executeQuery();
            rs.next();
            display =rs.getFloat(1);
        }catch (ClassNotFoundException e) {
            e.printStackTrace();                            // 处理ClassNotFoundException异常
        } catch (SQLException e) {
            e.printStackTrace();                            // 处理SQLException异常
        } finally {
            closeAll(conn,pstmt,null);
        }
        return display;
    }

    //按查询楼和门牌号查询
    public List<MeterLog> getMeterByBuildingandDoor(int building, String door,int type){
        List<MeterLog> list=new ArrayList<MeterLog>();
        String sql="select display,date from meterlog,metertype,userinfo,usermeter " +
                "where meterlog.meterid=usermeter.meterid and usermeter.userid=userinfo.id and " +
                "meterlog.meterid=metertype.meterid and door='"+door+"' and building= "+building+" and type="+type+" order by date desc";
        try {
            conn = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int k=5;
            while(rs.next()){
                MeterLog meterLog=new MeterLog();
                meterLog.setDate(rs.getDate(2));
                //meterLog.setMeterId(rs.getString("meterid"));
                meterLog.setDisplay(rs.getFloat(1));
                list.add(meterLog);
                k--;
                if(k<0) break;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            this.closeAll(conn, pstmt, rs);
        }
        return list;
    }

    //按用户id查询
    public List<MeterLog> getMeterByUserId(String id,int type){
        List<MeterLog> list=new ArrayList<MeterLog>();
        String sql="select display,date from meterlog,metertype,userinfo,usermeter " +
                "where meterlog.meterid=usermeter.meterid and usermeter.userid=userinfo.id and " +
                "meterlog.meterid=metertype.meterid and userid= '"+id+"' and type="+type+" order by date desc";
        try {
            conn = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int k=5;
            while(rs.next()){
                MeterLog meterLog=new MeterLog();
                meterLog.setDate(rs.getDate(2));
                //meterLog.setMeterId(rs.getString("meterid"));
                meterLog.setDisplay(rs.getFloat(1));
                list.add(meterLog);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            this.closeAll(conn, pstmt, rs);
        }
        return list;
    }

    //统计某一楼的示数
    public List<Collect> getAllByBuild(int building, int type){
        List<Collect> collects=new LinkedList<>();
        String sql="select name, building, door, max(display) from meterlog,metertype,userinfo,usermeter " +
                "where meterlog.meterid=usermeter.meterid and usermeter.userid=userinfo.id and meterlog.meterid=metertype.meterid and " +
                "building= "+building+" and type="+type+" group by name,door,building ";
        try {
            conn = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Collect collect = new Collect();
                collect.setName(rs.getString(1));
                collect.setDoor(rs.getString(3));
                collect.setBuilding(rs.getInt(2));
                collect.setDisplay(rs.getDouble(4));
                collects.add(collect);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            this.closeAll(conn, pstmt, rs);
        }
        return collects;
    }

    //统计小区的示数
    public List<Collect> getAll(int type){
        List<Collect> collects=new LinkedList<>();
        String sql="select name, building, door, max(display) from meterlog,metertype,userinfo,usermeter " +
                "where meterlog.meterid=usermeter.meterid and usermeter.userid=userinfo.id and meterlog.meterid=metertype.meterid and " +
                " type="+type+" group by name,door,building ";
        try {
            conn = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Collect collect = new Collect();
                collect.setName(rs.getString(1));
                collect.setDoor(rs.getString(3));
                collect.setBuilding(rs.getInt(2));
                collect.setDisplay(rs.getDouble(4));
                collects.add(collect);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            this.closeAll(conn, pstmt, rs);
        }
        return collects;
    }

}
