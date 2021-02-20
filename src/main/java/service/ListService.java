package service;

import Dao.listDao;
import entity.donation;

import java.util.List;

public class ListService {
    listDao listdao=new listDao();

    public List<donation> getDonationList(String email){
        return listdao.getDonationList(email);
    }

    public boolean isDonor(String email){
        return listdao.isDonor(email);
    }
}
