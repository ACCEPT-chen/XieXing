package controller;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import entity.donee;
import entity.donor;
import service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
     LoginService loginService=new LoginService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String param=req.getParameter("param");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
          if("login".equals(param)){
              String email = req.getParameter("email");
              String password = req.getParameter("password");
              String leixing=req.getParameter("type");
              Object object=loginService.loginService(email,password,leixing);
              if(object!=null) {
                  HttpSession session = req.getSession();
                  if ("donee".equals(leixing)) {
                      donee donee = (donee) object;
                      session.setAttribute("donee", donee);
                      req.getSession().setAttribute("username",donee.getName());
                      req.getSession().setAttribute("useremail",donee.getEmail());
                      resp.sendRedirect("index.jsp");
                  } else {
                      donor doner = (donor) object;
                      session.setAttribute("doner", doner);
                      req.getSession().setAttribute("username",doner.getName());
                      req.getSession().setAttribute("useremail",doner.getEmail());
                      resp.sendRedirect("index.jsp");
                  }
              }else {
                  req.setAttribute("error","邮箱或密码错误！");
                  req.getRequestDispatcher("login.jsp").forward(req,resp);
              }
          }
          else if("register".equals(param)){
              resp.sendRedirect("register.jsp");
          }else if("adduser".equals(param)){
              //创建smartupload组件
              SmartUpload su = new SmartUpload();
              //初始化SmartUpload
              su.initialize(getServletConfig(), req, resp);
              try {
                  su.upload();
              } catch (SmartUploadException e) {
                  e.printStackTrace();
              }
              req.setCharacterEncoding("utf-8");
              String email=su.getRequest().getParameter("email");
              String name=su.getRequest().getParameter("username");
              String password=su.getRequest().getParameter("password");
              String typeuse=su.getRequest().getParameter("usertype");
             // System.out.println(req.getRealPath("/photos"));
              String photosPath = req.getRealPath("/photos");
             // String Path="/photos";
              File file =su.getFiles().getFile(0);
              String photoName = new StringBuilder(new String(email).hashCode()).append(System.currentTimeMillis()).toString();
              try {
                  file.saveAs(photosPath+"\\"+photoName+".jpg");
              } catch (SmartUploadException e) {
                  e.printStackTrace();
              }
              if(loginService.findEmail(email)!=null) {
                  req.setAttribute("error","邮箱已存在，请直接登录");
                  req.getRequestDispatcher("login.jsp").forward(req,resp);
              }
              else {
                  loginService.saveuser(email, password, name, photoName, typeuse);
                  resp.sendRedirect("login.jsp");
              }
          }
    }
}
