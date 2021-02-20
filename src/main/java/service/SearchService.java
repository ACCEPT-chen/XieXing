package service;

import Dao.searchDao;
import entity.donation;
import entity.page;

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
}
