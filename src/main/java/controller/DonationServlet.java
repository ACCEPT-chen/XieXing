package controller;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import entity.donee;
import service.DonationService;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/donationServlet")
public class DonationServlet extends HttpServlet {
    DonationService donationService=new DonationService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String param=req.getParameter("param");
        if("donation".equals(param)){
            //创建smartupload组件
            SmartUpload su = new SmartUpload();
            //初始化SmartUpload
            su.initialize(getServletConfig(), req, resp);
            try {
                su.upload();
            } catch (SmartUploadException e) {
                e.printStackTrace();
            }
            String name=su.getRequest().getParameter("name");
            String type=su.getRequest().getParameter("type");
            String size=su.getRequest().getParameter("size");
            String sex=su.getRequest().getParameter("sex");
            System.out.println(req.getRealPath("/donation"));
            String photosPath = getServletContext().getRealPath("/donation");
            if(req.getSession().getAttribute("useremail")==null){
                req.setAttribute("error","请先登录用户");
                req.getRequestDispatcher("login.jsp").forward(req,resp);

            }
            String useremail=req.getSession().getAttribute("useremail").toString();
            // String Path="/photos";
            File file =su.getFiles().getFile(0);
            String photoName = new StringBuilder(new String("1").hashCode()).append(System.currentTimeMillis()).toString();
//            String id= new StringBuilder(new String(useremail).hashCode()).append(System.currentTimeMillis()).toString();
            String id=photoName;
            try {
                file.saveAs(photosPath+"\\"+photoName+".jpg");
            } catch (SmartUploadException e) {
                e.printStackTrace();
            }
            donationService.saveDonation(id,sex,name,size,type,photoName,useremail);
            resp.sendRedirect("thanks.jsp");
        }
    }
}
