package Dao;

import entity.donee;
import entity.donor;
import util.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginDao {
    public donee isExistsDonee(String account, String pwd) {
        donee donee=null;
        String sql = "select * from donee where email=? and password=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, account);
            pstmt.setString(2, pwd);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                String email=rs.getString(1);
                String password=rs.getString(3);
                String name=rs.getString(2);
                String photo=rs.getString(4);
                donee=new donee(email,password,name,photo);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return donee;
    }
    public donee findEmailDonee(String account) {
        donee donee=null;
        String sql = "select * from donee where email=? ";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, account);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                String email=rs.getString(1);
                String password=rs.getString(3);
                String name=rs.getString(2);
                String photo=rs.getString(4);
                donee=new donee(email,password,name,photo);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return donee;
    }
    public donor findEmailDonor(String account) {
        donor doner=null;
        String sql = "select * from donor where email=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, account);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                String email=rs.getString(1);
                String password=rs.getString(3);
                String name=rs.getString(2);
                String photo=rs.getString(4);
                doner=new donor(email,name,password,photo);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return doner;
    }

    public donor isExistsDonor(String account, String pwd) {
        donor doner=null;
        String sql = "select * from donor where email=? and password=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, account);
            pstmt.setString(2, pwd);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                String email=rs.getString(1);
                String password=rs.getString(3);
                String name=rs.getString(2);
                String photo=rs.getString(4);
                doner=new donor(email,name,password,photo);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return doner;
    }
    public void saveDonee(String email,String password,String name,String photo){
        String sql = "insert into donee(email,name,password,photo) values(?,?,?,?)";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,email);
            pstmt.setString(2,name);
            pstmt.setString(3,password);
            pstmt.setString(4,photo);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
    }
    public void saveDonor(String email,String password,String name,String photo){
        String sql = "insert into donor(email,name,password,photo) values(?,?,?,?)";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,email);
            pstmt.setString(2,name);
            pstmt.setString(3,password);
            pstmt.setString(4,photo);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
    }
}
