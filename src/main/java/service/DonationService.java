package service;

import Dao.donationDao;
import entity.donation;

import java.util.List;

public class DonationService {
    donationDao donationDao=new donationDao();
    public void saveDonation(String id,String sex,String name,String size,String type,String photo,String useremail){
        donationDao.saveDonation(id,sex,name,size,type,photo,useremail);
    }
    public List<donation> getDonationList(String email){
        return donationDao.getDonationList(email);
    }

    public boolean isDonor(String email){
        return donationDao.isDonor(email);
    }
}
