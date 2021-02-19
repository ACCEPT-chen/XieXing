package service;

import Dao.loginDao;

public class LoginService {
    loginDao logindao=new loginDao();
    public  Object loginService(String account,String pwd,String usertype){
        if("donee".equals(usertype))
                return logindao.isExistsDonee(account,pwd);
        else
                return logindao.isExistsDonor(account,pwd);
    }
    public  void saveuser(String email,String password,String name,String photo,String usertype){
        if("donee".equals(usertype))  logindao.saveDonee(email,password,name,photo);
        else  logindao.saveDonor(email,password,name,photo);
    }
    public Object findEmail(String email){
        Object object=logindao.findEmailDonee(email);
        if(object!=null) return object;
        object=logindao.findEmailDonor(email);
        return object;
    }
    //public  boolean  loginServiceDonee(String account,String pwd) {return logindao.isExistsDonee(account,pwd);}
    //public  boolean  loginServiceDoner(String account,String pwd) {return logindao.isExistsDoner(account,pwd);}
}
