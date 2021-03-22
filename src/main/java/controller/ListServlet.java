package controller;

import entity.ddonation;
import entity.donation;
import service.DonationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/listServlet")
public class ListServlet extends HttpServlet {
    private DonationService donationService = new DonationService();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email=(String)req.getSession().getAttribute("useremail");
        if (donationService.isDonor(email)) {
            List<donation> donationList = donationService.getDonationListofDonor(email);
            if (donationList.size() != 0) {
                req.setAttribute("donationList", donationList);
                req.getRequestDispatcher("listDonor.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("donation.jsp").forward(req, resp);
            }
        } else if(donationService.isDonee(email)){
            List<donation> donationList = donationService.getDonationListofDonee(0,email);//没有匹配的订单展示鞋子信息
            List<ddonation> ddonationList=donationService.getDDonationListofDonee(email);//已经匹配的订单还要展现捐献者信息
            if (donationList.size() != 0||ddonationList.size()!=0) {
                req.setAttribute("donationList", donationList);
                req.setAttribute("ddonationList", ddonationList);
                req.getRequestDispatcher("listDonee.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("shopping.jsp").forward(req, resp);
            }
        }else{
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
