package Controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/UploadService")

public class UploadService extends HttpServlet {
     protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 request.setCharacterEncoding("UTF-8");
         String fileName = request.getParameter("file");
         System.out.println(fileName);
         
         ServletContext context = getServletContext(); //어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨. 
         String saveDir = context.getRealPath("Upload"); //절대경로를 가져옴
         System.out.println("절대경로 >> " + saveDir);
         
         int maxSize = 3*1024*1024; // 3MB
         
         String encoding = "euc-kr";
         
         MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
     }
}