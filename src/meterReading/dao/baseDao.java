package meterReading.dao;
import java.sql.*;
public class baseDao {
    public final static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";           // 数据库驱动
    public final static String url    = "jdbc:sqlserver://localhost:1433;DatabaseName=meterreader";     // url
    public final static String dbName = "sa";                                                  // 数据库用户名
    public final static String dbPass = "sms";                                                     // 数据库密码

    //得到数据库连接
    public Connection getConn() throws ClassNotFoundException, SQLException{
        Connection conn = null;
        Class.forName(driver);
        conn=DriverManager.getConnection(url,dbName,dbPass);
        return conn ;                                                            //返回连接
    }

    //释放资源
    public void closeAll( Connection conn, PreparedStatement pstmt, ResultSet rs ) {
        if(rs != null){
            try { rs.close();} catch (SQLException e) {e.printStackTrace();}
        }
        if(pstmt != null){
            try { pstmt.close();} catch (SQLException e) {e.printStackTrace();}
        }
        if(conn != null){
            try { conn.close();} catch (SQLException e) {e.printStackTrace();}
        }
    }


    //执行SQL语句，可以进行增、删、改的操作，不能执行查询
    public int executeSQL(String preparedSql,Object[] param) {
        Connection        conn  = null;
        PreparedStatement pstmt = null;
        int               num   = 0;

        /*  处理SQL,执行SQL  */
        try {
            conn = getConn();
            pstmt=conn.prepareStatement(preparedSql);
            if( param != null ) {
                for( int i = 0; i < param.length; i++ ) {
                    pstmt.setObject(i+1,param[i]);
                }
            }
            num = pstmt.executeUpdate();                    // 执行SQL语句
        } catch (ClassNotFoundException e) {
            e.printStackTrace();                            // 处理ClassNotFoundException异常
        } catch (SQLException e) {
            e.printStackTrace();                            // 处理SQLException异常
        } finally {
            closeAll(conn,pstmt,null);
        }
        return num;
    }
}
