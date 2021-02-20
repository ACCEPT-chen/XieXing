package controller;

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
        String email = req.getParameter("param");
        if (donationService.isDonor(email)) {
            List<donation> donationList = donationService.getDonationList(email);
            if (donationList.size() != 0) {
                req.setAttribute("donationList", donationList);
                req.getRequestDispatcher("list.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("donation.jsp").forward(req, resp);
            }
        } else {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
