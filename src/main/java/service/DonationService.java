package service;

import Dao.donationDao;

public class DonationService {
    donationDao donationDao=new donationDao();
    public void saveDonation(String id,String sex,String name,String size,String type,String photo,String useremail){
        donationDao.saveDonation(id,sex,name,size,type,photo,useremail);
    }
}
