package controller;

import entity.donation;
import entity.page;
import service.SearchService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/searchServlet")
public class SearchServlet extends HttpServlet {
    SearchService searchService=new SearchService();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String param=req.getParameter("param");
        String type=req.getParameter("type");
        if("surf".equals(param)){
            //by type
//            List<donation> ShoesListByType=searchService.getDonationByType(type);
//            req.setAttribute("shoes_list",ShoesListByType);

            //by page
            Integer pageno=Integer.parseInt(req.getParameter("pageno"));
            List<donation> ShoesListByType= searchService.getDonationByType_pageNo(type,pageno);
//            Map<String,Integer> totalNumList=searchService.getDonationNum();
//            Integer totalNum=totalNumList.get(type);
            Integer totalNum=searchService.getSingleTypeNum(type);
            page shoesPage=new page();
            shoesPage.setDonationList(ShoesListByType);
            shoesPage.setTotalNum(totalNum);
            shoesPage.setPageNo(pageno);

            req.setAttribute("shoesPage",shoesPage);
            req.setAttribute("type",type);
            req.getRequestDispatcher("search.jsp").forward(req,resp);
        }else if("check".equals(param)){
            String donationid=req.getParameter("checkid");
            donation donation=searchService.getDonationById(donationid);
            String donorname=searchService.getDonorNameByEmail(donation.getUseremail());
            req.setAttribute("donation",donation);
            req.setAttribute("donorname",donorname);
            req.getRequestDispatcher("checkout.jsp").forward(req,resp);
        }
    }
}
