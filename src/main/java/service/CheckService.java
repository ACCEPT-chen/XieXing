package service;

import Dao.shoppingDao;
import entity.shopping;

public class CheckService {
    shoppingDao shoppingDao=new shoppingDao();

    public void addShopping(shopping shopping) {
        shoppingDao.addShopping(shopping);
    }
}
