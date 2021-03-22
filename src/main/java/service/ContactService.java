package service;

import Dao.loginDao;
import Dao.shoppingDao;
import entity.donee;
import entity.donor;
import entity.shopping;

public class ContactService {
    shoppingDao shoppingDao=new shoppingDao();
    loginDao loginDao=new loginDao();

    public shopping findShoppingByDonationid(String donationid){
        return shoppingDao.findShoppingByDonationid(donationid);
    }

    public donee findEmailDonee(String email){
        return loginDao.findEmailDonee(email);
    }
    public void resetId(String id,String reid){
        shoppingDao.resetId(id,reid);
    }

    public void setShoppingCond1(String id){shoppingDao.setShoppingCond1(id);}
    public donor findEmailDonor(String email){
        return loginDao.findEmailDonor(email);
    }
}
