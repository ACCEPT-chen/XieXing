package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

//数据库资源管理工具
public class DBUtil {

    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;

    private static DBUtil instance = new DBUtil();

    private DBUtil() {}

    static {
        //加载驱动
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static DBUtil getInstance() {
        return instance;
    }

    //实例化数据库连接conn
    public Connection getConnection() {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://47.96.153.145:3306/xiexing?useSSL=false&serverTimezone=UTC", "root", "root");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return conn;
    }

    //实例化SQL执行句柄stmt
    public Statement getStatement() {
        Connection conn = getConnection();
        try {
            if(conn != null) {
                stmt = conn.createStatement();
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return stmt;
    }

    //实例化SQL执行句柄pstmt
    public PreparedStatement getPreparedStatement(String sql) {
        Connection conn = getConnection();
        try {
            if(conn != null) {
                pstmt = conn.prepareStatement(sql);
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        return pstmt;
    }

    //关闭数据库连接资源
    public void closeDBResources() {
        try {
            if(pstmt != null && !pstmt.isClosed()) {
                pstmt.close();
            }
            if(stmt != null && !stmt.isClosed()) {//如果stmt不为空，并且还未关闭
                stmt.close();
            }
            if(conn != null && !conn.isClosed()) {
                conn.close();
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }

    }

}

