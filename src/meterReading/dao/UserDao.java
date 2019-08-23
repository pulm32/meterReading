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
        String sql = "select * from USERINFO  ";
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
                user.setPermanent(rs.getString("permanent"));
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

    //新建
    public int insert(UserInfo userInfo){
        StringBuffer sbSql = new StringBuffer("insert into UserInfo(id,name,building,door,phone,mobilephone,");
        sbSql.append("workunit,permanent,valid)");
        sbSql.append("values(?,?,?,?,?,?,?,?,1)");
        Object[] param = {userInfo.getId(),userInfo.getName(),userInfo.getBuilding(),userInfo.getDoor(),userInfo.getPhone(),userInfo.getMobilephone(),
                userInfo.getWorkunit(),userInfo.getPermanent()};
        return super.executeSQL(sbSql.toString(), param);
    }

    //保存一条信息
    public int save(UserInfo userInfo){
        StringBuffer sbSql = new StringBuffer("update UserInfo set name=?,building=?,door=?,phone=?,mobilephone=?,");
        sbSql.append("workunit=?,permanent=?,valid=?");
        sbSql.append("where id="+userInfo.getId());
        Object[] param = {userInfo.getName(),userInfo.getBuilding(),userInfo.getDoor(),userInfo.getPhone(),userInfo.getMobilephone(),
                userInfo.getWorkunit(),userInfo.getPermanent(),userInfo.getValid()};
        return super.executeSQL(sbSql.toString(), param);
    }

    //按楼号查找用户信息
    public List<UserInfo> getUserByBuilding(int building){
        List<UserInfo> list = new ArrayList<UserInfo>();
        String sql = "select * from USERINFO  where building="+building;
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
                user.setPermanent(rs.getString("permanent"));
                user.setValid(rs.getInt("valid"));
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
