package meterReading.dao;
import meterReading.entity.*;
import java.sql.*;
import java.util.*;
import meterReading.util.Tool;

public class UserDao extends baseDao{
    private Connection conn  = null;   // 数据库连接
    private PreparedStatement pstmt = null;   // 创建PreparedStatement对象
    private ResultSet rs    = null;   // 创建结果集对象

    // 查询用户列表
    public List<UserInfo> listUser() {
        List<UserInfo> list = new ArrayList<UserInfo>();
        String sql = "select * from USERINFO where valid=true ";
        try {
            conn = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                UserInfo user = new UserInfo();
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setBuilding(rs.getInt("building"));
                user.setDoor(rs.getString("door"));
                user.setPhone(rs.getString("phone"));
                user.setMobilephone(rs.getString("mobilephone"));
                user.setWorkunit(rs.getString("workunit"));
                user.setPermanent(rs.getBoolean("permanent"));
                list.add(user);
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
}
