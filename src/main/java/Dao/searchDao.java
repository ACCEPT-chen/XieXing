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
        String sql = "select * from donation where type=? and cond=0";
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
        String sql = "select * from donation where type=? and cond=0 limit ?,?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            Integer last=(pageno-1)*pagesize;
            pstmt.setString(1,type);
            pstmt.setInt(2, last);
            pstmt.setInt(3, pagesize);
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
        String sql="select name from donor where email=?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1, useremail);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                username=rs.getString("name");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return username;
    }

    public Integer getSingleTypeNum(String type) {
        Integer num=0;
        String sql="select count(*) from donation where type=? and cond=0";
        PreparedStatement pstmt=DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,type);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
                num=rs.getInt(1);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.getInstance().closeDBResources();
        }
        return num;
    }

    public List<donation> getDonationByAll_pageNo(String type, String size, String sex, Integer pageno) {
        List<donation> donationList=new ArrayList<>();
        page page=new page();
        int pagesize=page.getPageSize();
        String sql = "select * from donation where type=? and size=? and sex=? and cond=0 limit ?,?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            Integer last=(pageno-1)*pagesize;
            pstmt.setString(1,type);
            pstmt.setString(2,size);
            pstmt.setString(3,sex);
            pstmt.setInt(4, last);
            pstmt.setInt(5, pagesize);
            ResultSet rs = pstmt.executeQuery();
            donation shoe;
            while(rs.next()) {
                //TODO:修改为columnLabel
                String id=rs.getString("id");
                String name=rs.getString("name");
//                String size=rs.getString("size");
                String photo=rs.getString("photo");
                String typee=rs.getString("type");
//                String sex=rs.getString("sex");
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

    public List<donation> getDonationBySize_pageNo(String size, Integer pageno) {
        List<donation> donationList=new ArrayList<>();
        page page=new page();
        int pagesize=page.getPageSize();
        String sql = "select * from donation where size=? and cond=0 limit ?,?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            Integer last=(pageno-1)*pagesize;
            pstmt.setString(1,size);
            pstmt.setInt(2, last);
            pstmt.setInt(3, pagesize);
            ResultSet rs = pstmt.executeQuery();
            donation shoe;
            while(rs.next()) {
                //TODO:修改为columnLabel
                String id=rs.getString("id");
                String name=rs.getString("name");
//                String size=rs.getString("size");
                String photo=rs.getString("photo");
                String type=rs.getString("type");
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

    public List<donation> getDonationBySex_pageNo(String sex, Integer pageno) {
        List<donation> donationList=new ArrayList<>();
        page page=new page();
        int pagesize=page.getPageSize();
        String sql = "select * from donation where sex=? and cond=0 limit ?,?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            Integer last=(pageno-1)*pagesize;
            pstmt.setString(1,sex);
            pstmt.setInt(2, last);
            pstmt.setInt(3, pagesize);
            ResultSet rs = pstmt.executeQuery();
            donation shoe;
            while(rs.next()) {
                //TODO:修改为columnLabel
                String id=rs.getString("id");
                String name=rs.getString("name");
                String size=rs.getString("size");
                String photo=rs.getString("photo");
                String type=rs.getString("type");
//                String sex=rs.getString("sex");
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

    public List<donation> getDonationAll_pageNo(Integer pageno) {
        List<donation> donationList=new ArrayList<>();
        page page=new page();
        int pagesize=page.getPageSize();
        String sql = "select * from donation where cond=0 limit ?,?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            Integer last=(pageno-1)*pagesize;
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
                String type=rs.getString("type");
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

    public List<donation> getDonationSZ_pageNo(String size, String sex, Integer pageno) {
        List<donation> donationList=new ArrayList<>();
        page page=new page();
        int pagesize=page.getPageSize();
        String sql = "select * from donation where sex=? and size=? and cond=0 limit ?,?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            Integer last=(pageno-1)*pagesize;
            pstmt.setString(1,sex);
            pstmt.setString(2,size);
            pstmt.setInt(3, last);
            pstmt.setInt(4, pagesize);
            ResultSet rs = pstmt.executeQuery();
            donation shoe;
            while(rs.next()) {
                //TODO:修改为columnLabel
                String id=rs.getString("id");
                String name=rs.getString("name");
//                String size=rs.getString("size");
                String photo=rs.getString("photo");
                String type=rs.getString("type");
//                String sex=rs.getString("sex");
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

    public List<donation> getDonationTS_pageNo(String type, String sex, Integer pageno) {
        List<donation> donationList=new ArrayList<>();
        page page=new page();
        int pagesize=page.getPageSize();
        String sql = "select * from donation where sex=? and type=? and cond=0 limit ?,?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            Integer last=(pageno-1)*pagesize;
            pstmt.setString(1,sex);
            pstmt.setString(2,type);
            pstmt.setInt(3, last);
            pstmt.setInt(4, pagesize);
            ResultSet rs = pstmt.executeQuery();
            donation shoe;
            while(rs.next()) {
                //TODO:修改为columnLabel
                String id=rs.getString("id");
                String name=rs.getString("name");
                String size=rs.getString("size");
                String photo=rs.getString("photo");
//                String type=rs.getString("type");
//                String sex=rs.getString("sex");
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

    public List<donation> getDonationTZ_pageNo(String type, String size, Integer pageno) {
        List<donation> donationList=new ArrayList<>();
        page page=new page();
        int pagesize=page.getPageSize();
        String sql = "select * from donation where type=? and size=? and cond=0 limit ?,?";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            Integer last=(pageno-1)*pagesize;
            pstmt.setString(1,type);
            pstmt.setString(2,size);
            pstmt.setInt(3, last);
            pstmt.setInt(4, pagesize);
            ResultSet rs = pstmt.executeQuery();
            donation shoe;
            while(rs.next()) {
                //TODO:修改为columnLabel
                String id=rs.getString("id");
                String name=rs.getString("name");
//                String size=rs.getString("size");
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

    public Integer getDonationAll_num() {
        Integer res=0;
        page page=new page();
        String sql = "select count(*) as count from donation where cond=0";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                res=rs.getInt("count");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return res;
    }

    public Integer getDonationBySize_num(String size) {
        Integer res=0;
        page page=new page();
        String sql = "select count(*) as count from donation where size=? and cond=0";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,size);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                res=rs.getInt("count");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return res;
    }

    public Integer getDonationBySex_num(String sex) {
        Integer res=0;
        page page=new page();
        String sql = "select count(*) as count from donation where sex=? and cond=0";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,sex);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                res=rs.getInt("count");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return res;
    }

    public Integer getDonationSZ_num(String size, String sex) {
        Integer res=0;
        page page=new page();
        String sql = "select count(*) as count from donation where size=? and sex=? and cond=0";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,size);
            pstmt.setString(2,sex);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                res=rs.getInt("count");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return res;
    }

    public Integer getDonationTS_num(String type, String sex) {
        Integer res=0;
        page page=new page();
        String sql = "select count(*) as count from donation where type=? and sex=? and cond=0";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,type);
            pstmt.setString(2,sex);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                res=rs.getInt("count");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return res;
    }

    public Integer getDonationTZ_num(String type, String size) {
        Integer res=0;
        page page=new page();
        String sql = "select count(*) as count from donation where size=? and type=? and cond=0";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,size);
            pstmt.setString(2,type);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                res=rs.getInt("count");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return res;
    }

    public Integer getDonationByAll_num(String type, String size, String sex) {
        Integer res=0;
        page page=new page();
        String sql = "select count(*) as count from donation where  size=? and sex=? and type=? and cond=0";
        PreparedStatement pstmt = DBUtil.getInstance().getPreparedStatement(sql);
        try {
            pstmt.setString(1,size);
            pstmt.setString(2,sex);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //TODO:修改为columnLabel
                res=rs.getInt("count");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.getInstance().closeDBResources();
        }
        return res;
    }
}
