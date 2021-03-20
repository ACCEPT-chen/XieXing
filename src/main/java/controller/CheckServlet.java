package controller;

import entity.shopping;
import service.CheckService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
@WebServlet("/checkServlet")
public class CheckServlet extends HttpServlet {
    CheckService checkService=new CheckService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String param=req.getParameter("param");
        String type=req.getParameter("type");
        if("add".equals(param)){
            String donationid=req.getParameter("donationid");
            String donoremail=req.getParameter("donoremail");
            String doneeemail=req.getParameter("doneeemail");
            String phone=req.getParameter("phone");
            String address=req.getParameter("address");
            String time=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            String id= new StringBuilder(donationid.hashCode()).append(System.currentTimeMillis()).toString();
            shopping shopping=new shopping(id,donationid,donoremail,doneeemail,phone,address,time);
            checkService.addShopping(shopping);
            resp.sendRedirect("searchServlet?param=surf&type="+type);
        }
    }
}
