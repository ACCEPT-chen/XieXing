package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.donation;
import util.DBUtil;

public class listDao {
    public List<donation> getDonationList(){
        List<donation> donationList =new ArrayList<donation>();
        String sql="select * from donation";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                String id=rs.getString("id");
                String name=rs.getString("name");
                String size=rs.getString("size");
                String type=rs.getString("type");
                String photo=rs.getString("photo");
                String sex=rs.getString("sex");
                String useremail=rs.getString("useremail");
                String cond=rs.getString("cond");

                donation d = new donation(id,name,size,type,photo,sex,useremail,cond);
                donationList.add(d);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return donationList;
        }

}
