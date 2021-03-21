package service;

import Dao.donationDao;
import Dao.shoppingDao;
import entity.shopping;

public class CheckService {
    shoppingDao shoppingDao=new shoppingDao();
    donationDao donationdao=new donationDao();

    public void addShopping(shopping shopping) {
        shoppingDao.addShopping(shopping);
    }

    public void changecond(String donationid) {
        donationdao.changcond(donationid);
    }
}
