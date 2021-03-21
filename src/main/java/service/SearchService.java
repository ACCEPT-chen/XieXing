package service;

import Dao.searchDao;
import entity.donation;
import entity.page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SearchService {
    searchDao searchDao=new searchDao();
    public List<donation> getDonationByType(String type) {
        return searchDao.getDonationByType(type);
    }

    public List<donation> getDonationByType_pageNo(String type, int pageno) {
    return searchDao.getDonationByType_pageNo(type,pageno);
    }

    public Map<String, Integer> getDonationNum() {
        return searchDao.getDonationNum();
    }

    public donation getDonationById(String donationid) {
        return searchDao.getDonationById(donationid);
    }

    public String getDonorNameByEmail(String useremail) {
        return searchDao.getDonorNameByEmail(useremail);
    }

    public Integer getSingleTypeNum(String type) {
        return searchDao.getSingleTypeNum(type);
    }

    public List<donation> getDonationByAll_pageNo(String type, String size, String sex, Integer pageno) {
        List<donation> res=new ArrayList<>();
        if("全部类型".equals(type)&&"全部尺码".equals(size)&&"全部".equals(sex)){
            res=searchDao.getDonationAll_pageNo(pageno);
        }else if("全部尺码".equals(size)&&"全部".equals(sex)){
            res=searchDao.getDonationByType_pageNo(type,pageno);
        }else if("全部类型".equals(type)&&"全部".equals(sex)){
            res=searchDao.getDonationBySize_pageNo(size,pageno);
        }else if("全部类型".equals(type)&&"全部尺码".equals(size)){
            res=searchDao.getDonationBySex_pageNo(sex,pageno);
        }else if("全部类型".equals(type)){
            res=searchDao.getDonationSZ_pageNo(size,sex,pageno);
        }else if("全部尺码".equals(size)){
            res=searchDao.getDonationTS_pageNo(type,sex,pageno);
        }else if("全部".equals(sex)){
            res=searchDao.getDonationTZ_pageNo(type,size,pageno);
        }else{
            res=searchDao.getDonationByAll_pageNo(type,size,sex,pageno);
        }
       return res;
    }

    public Integer getDonationByAll_num(String type, String size, String sex, Integer pageno) {
        Integer res=0;
        if("全部类型".equals(type)&&"全部尺码".equals(size)&&"全部".equals(sex)){
            res=searchDao.getDonationAll_num();
        }else if("全部尺码".equals(size)&&"全部".equals(sex)){
            res=searchDao.getSingleTypeNum(type);
        }else if("全部类型".equals(type)&&"全部".equals(sex)){
            res=searchDao.getDonationBySize_num(size);
        }else if("全部类型".equals(type)&&"全部尺码".equals(size)){
            res=searchDao.getDonationBySex_num(sex);
        }else if("全部类型".equals(type)){
            res=searchDao.getDonationSZ_num(size,sex);
        }else if("全部尺码".equals(size)){
            res=searchDao.getDonationTS_num(type,sex);
        }else if("全部".equals(sex)){
            res=searchDao.getDonationTZ_num(type,size);
        }else{
            res=searchDao.getDonationByAll_num(type,size,sex);
        }
        return res;
    }
}
