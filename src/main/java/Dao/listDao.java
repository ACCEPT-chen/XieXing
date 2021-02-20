package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.donation;
import util.DBUtil;

public class listDao {
    public List<donation> getDonationList(String email) {
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
                String photopath="photos/"+photo+".jpg";
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

}
