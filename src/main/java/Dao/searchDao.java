package Dao;

import entity.donation;
import entity.page;
import util.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class searchDao {
    public List<donation> getDonationByType(String type) {
        List<donation> donationList=new ArrayList<>();
        String sql = "select * from donation where type=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, type);
            ResultSet rs = pstmt.executeQuery();
            donation shoe;
            while(rs.next()) {
                //TODO:修改为columnLabel
                String id=rs.getString("id");
                String name=rs.getString("name");
                String size=rs.getString("size");
                String photo=rs.getString("photo");
//                String type=rs.getString("type");
                String sex=rs.getString("sex");
                String useremail=rs.getString("useremail");
                String cond=rs.getString("cond");
                shoe=new donation(id,name, size,type,photo,sex,useremail,cond);
                donationList.add(shoe);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return donationList;
    }

    public Map<String,Integer> getDonationNum() {
        Map<String,Integer> ShoesNum=new HashMap<>();
        String sql="select * from shoes_num";
        PreparedStatement pstmt=DBUtil.getInstance().getPreparedStatement(sql);
        try {
            ResultSet rs=pstmt.executeQuery();
            String type;
            Integer num=0;
            while(rs.next()){
                type=rs.getString("type");
                num=rs.getInt("num");
                ShoesNum.put(type,num);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return ShoesNum;
    }

    public List<donation> getDonationByType_pageNo(String type, int pageno) {
       List<donation> donationList=new ArrayList<>();
        page page=new page();
        int pagesize=page.getPageSize();
        String sql = "select * from donation where type=? limit?,?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            Integer last=pageno*pagesize;
            pstmt.setInt(1, last);
            pstmt.setInt(2, pagesize);
            ResultSet rs = pstmt.executeQuery();
            donation shoe;
            while(rs.next()) {
                //TODO:修改为columnLabel
                String id=rs.getString("id");
                String name=rs.getString("name");
                String size=rs.getString("size");
                String photo=rs.getString("photo");
                String typee=rs.getString("type");
                String sex=rs.getString("sex");
                String useremail=rs.getString("useremail");
                String cond=rs.getString("cond");
                shoe=new donation(id,name, size,type,photo,sex,useremail,cond);
                donationList.add(shoe);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return donationList;
    }

    public donation getDonationById(String donationid) {
        donation shoe = null;
        String sql = "select * from donation where id=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, donationid);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                String id=rs.getString("id");
                String name=rs.getString("name");
                String size=rs.getString("size");
                String photo=rs.getString("photo");
                String type=rs.getString("type");
                String sex=rs.getString("sex");
                String useremail=rs.getString("useremail");
                String cond=rs.getString("cond");
                shoe=new donation(id,name, size,type,photo,sex,useremail,cond);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return shoe;
    }

    public String getDonorNameByEmail(String useremail) {
        String username = null;
        String sql="select username from donator where useremail=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, useremail);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                username=rs.getString("username");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return username;
    }
}
