package Dao;

import entity.donation;
import util.DBUtil;

import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public List<donation> getDonationListofDonor(String email) {
        List<donation> donationList = new ArrayList<donation>();
        String sql = "select * from donation where useremail=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String size = rs.getString("size");
                String type = rs.getString("type");
                String photo = rs.getString("photo");
                String photopath="donation/"+photo+".jpg";
                String sex = rs.getString("sex");
                String useremail = rs.getString("useremail");
                String cond = rs.getString("cond");

                donation d = new donation(id, name, size, type, photopath, sex, useremail, cond);
                donationList.add(d);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.getInstance().closeDBResources();
        }
        return donationList;
    }
    public boolean isDonor(String email){
        boolean isExist=false;
        String sql="select count(*)=1 from donor where email=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                isExist=true;
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.getInstance().closeDBResources();
        }
        return isExist;
    }

    public void changcond(String donationid) {
        String sql="update donation set cond=1 where id=?";
        PreparedStatement pstmt=DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,donationid);
            pstmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public boolean isDonee(String email){
        boolean isExist=false;
        String sql="select count(*)=1 from donee where email=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                isExist=true;
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.getInstance().closeDBResources();
        }
        return isExist;
    }

    public List<donation> getDonationListofDonee(Integer ttype,String email){
        List<donation> donationList = new ArrayList<donation>();
        String sql=null;
        if(ttype==0) {
            sql = "select * from donation where donation.id in(select distinct donationid from shopping where doneeemail=? and shopping.cond='0')";
        }else{
            sql ="select * from donation where donation.id in(select distinct donationid from shopping where doneeemail=? and shopping.cond='1')";
        }
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String size = rs.getString("size");
                String type = rs.getString("type");
                String photo = rs.getString("photo");
                String photopath="donation/"+photo+".jpg";
                String sex = rs.getString("sex");
                String useremail = rs.getString("useremail");
                String cond = rs.getString("cond");

                donation d = new donation(id, name, size, type, photopath, sex, useremail, cond);
                donationList.add(d);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.getInstance().closeDBResources();
        }
        return donationList;
    }

}
