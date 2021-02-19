package Dao;

import util.DBUtil;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class donationDao {
    public void saveDonation(String id,String sex,String name,String size,String type,String photo,String useremail){
        String sql = "insert into donation(name,size,type,photo,useremail,id,sex,cond) values(?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            String cond=new String("0");
            pstmt.setString(1,name);
            pstmt.setString(2,size);
            pstmt.setString(3,type);
            pstmt.setString(4,photo);
            pstmt.setString(5,useremail);
            pstmt.setString(6,id);
            pstmt.setString(7,sex);
            pstmt.setString(8,cond);
            pstmt.executeUpdate();
            System.out.println(cond);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
    }

}
