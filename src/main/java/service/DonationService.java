package service;

import Dao.donationDao;
import Dao.loginDao;
import entity.ddonation;
import entity.donation;
import entity.donor;

import java.util.ArrayList;
import java.util.List;

public class DonationService {
    donationDao donationDao=new donationDao();
    loginDao loginDao=new loginDao();
    public void saveDonation(String id,String sex,String name,String size,String type,String photo,String useremail){
        donationDao.saveDonation(id,sex,name,size,type,photo,useremail);
    }
    public List<donation> getDonationListofDonor(String email){
        return donationDao.getDonationListofDonor(email);
    }


    public boolean isDonor(String email){
        return donationDao.isDonor(email);
    }
    public boolean isDonee(String email){
        return donationDao.isDonee(email);
    }
    public List<donation> getDonationListofDonee(Integer type,String email){
        return donationDao.getDonationListofDonee(type,email);
    }
    public List<ddonation> getDDonationListofDonee(String email){
        List<donation> donationList=donationDao.getDonationListofDonee(1,email);
        List<ddonation> ddonationList=new ArrayList<ddonation>();
        for (int i=0;i<donationList.size();i++){
            donor d=(donor)loginDao.findEmailDonor(donationList.get(i).getUseremail());
            ddonation dd=new ddonation(donationList.get(i),d);
            ddonationList.add(dd);
        }
        return ddonationList;
    }
}
