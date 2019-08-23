package meterReading.dao;

import java.sql.*;
import meterReading.entity.*;


public class MeterDao extends baseDao{
    private Connection conn  = null;   // 数据库连接
    private PreparedStatement pstmt = null;   // 创建PreparedStatement对象
    private ResultSet rs    = null;   // 创建结果集对象

    //查询当前示数
    public float getDisplay(int building,String door,int type){
        float display=0;
        String sql="select MAX(display) from ";
        try{
            conn=super.getConn();
            pstmt = conn.prepareStatement(sql);
            rs    = pstmt.executeQuery();
            rs.next();
            display =rs.getInt(1);
        }catch (ClassNotFoundException e) {
            e.printStackTrace();                            // 处理ClassNotFoundException异常
        } catch (SQLException e) {
            e.printStackTrace();                            // 处理SQLException异常
        } finally {
            closeAll(conn,pstmt,null);
        }
        return display;
    }
}
