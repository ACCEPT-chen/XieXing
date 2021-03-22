package Dao;

import entity.shopping;
import util.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class shoppingDao {
    public shopping findShoppingByDonationid(String donationid) {
        shopping shopping=null;
        String sql = "select * from shopping where donationid=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, donationid);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                String id=rs.getString(1);
                String ddonationid=rs.getString(2);
                String donoremail=rs.getString(3);
                String doneeemail=rs.getString(4);
                String phone=rs.getString(5);
                String address=rs.getString(6);
                String time=rs.getString(7);
                Integer cond=rs.getInt(8);
                shopping=new shopping(id,ddonationid,donoremail,doneeemail,phone,address,time,cond);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return shopping;
    }
    public void resetId(String id,String reid){
        String sql="update shopping set shopping.id=? where shopping.id=?";
    }

    public void addShopping(shopping shopping) {
        String sql="insert into shopping(id,donationid,donoremail,doneeemail,phone,address,time) values(?,?,?,?,?,?,?)";
        PreparedStatement pstmt=DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,shopping.getId());
            pstmt.setString(2,shopping.getDonationid());
            pstmt.setString(3,shopping.getDonoremail());
            pstmt.setString(4,shopping.getDoneeemail());
            pstmt.setString(5,shopping.getPhone());
            pstmt.setString(6,shopping.getAddress());
            pstmt.setString(7,shopping.getTime());

            pstmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
    }
    public void setShoppingCond1(String id){
        String sql="update shopping set cond=1 where shopping.id=?";
        PreparedStatement pstmt=DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,id);

            pstmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
    }
}
