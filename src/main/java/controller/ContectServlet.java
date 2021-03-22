package controller;

import entity.donation;
import entity.donee;
import entity.donor;
import entity.shopping;
import service.ContactService;
import service.DonationService;
import service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/contactServlet")
public class ContectServlet extends HttpServlet {
    ContactService contactService = new ContactService();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String param = req.getParameter("param");
        String id = req.getParameter("id");

        shopping s = contactService.findShoppingByDonationid(id);
        if("lookor".equals(param)){
            donee d=contactService.findEmailDonee(s.getDoneeemail());
            req.setAttribute("shopping", s);
            req.setAttribute("donee",d);
            req.getRequestDispatcher("contactDonor.jsp").forward(req, resp);
        }else if("da".equals(param)){
            contactService.setShoppingCond1(id);
            req.getRequestDispatcher("listServlet").forward(req,resp);
        }else if("lookee".equals(param)){
            donor d=contactService.findEmailDonor(s.getDonoremail());
            req.setAttribute("donor",d);

        }else{
            req.getRequestDispatcher("listServlet").forward(req,resp);
        }




    }

}
