package Utilities;

import Database.MySQLDatabase;
import javafx.scene.input.PickResult;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by chenyitian on 17-5-22.
 */

@WebServlet(name = "FileUploadServlet")
public class fileUploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        System.out.println("begin servlet");
        String bookname="fail",author="fail",ownerID,publisher="fail",comment="fail";
        double price=0;
        String pictureURL="http://localhost:8080/index/imgs/imgsb.png";

        HttpSession session=req.getSession();
        ownerID=(String) session.getAttribute("studentID");





        String savePath=getServletContext().getRealPath("/imgs");

        File saveDir=new File(savePath);
        if (!saveDir.exists()){
            saveDir.mkdir();
        }
        DiskFileItemFactory factory=new DiskFileItemFactory();
        ServletFileUpload sfu=new ServletFileUpload(factory);
        sfu.setHeaderEncoding("UTF-8");
        sfu.setFileSizeMax(1024*1024*20);
        sfu.setSizeMax(1024*1024*200);
        try{
            // 处理表单请求
            List<FileItem> itemList = sfu.parseRequest(req);
            for (FileItem fileItem : itemList) {
                // 对应表单中的控件的name
                String fieldName = fileItem.getFieldName();
                System.out.println("控件名称：" + fieldName);
                // 如果是普通表单控件
                if(fileItem.isFormField()){
                    String value = fileItem.getString();
                    //重新编码,解决乱码
                    value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
                    if (fieldName.equals("bookname")){
                        bookname=value;
                    }else if (fieldName.equals("author")){
                        author=value;
                    }else if (fieldName.equals("publisher")){
                        publisher=value;
                    }else if (fieldName.equals("price")){
                        price=Double.valueOf(value);
                    }else if (fieldName.equals("comment")){
                        comment=value;
                    }

//                    String bookname=req.getParameter("bookname");
//                    String author=req.getParameter("author");
//                    String publisher=req.getParameter("publisher");
//                    double price=Double.valueOf(req.getParameter("price"));
//                    String comment=req.getParameter("comment");
                    System.out.println("普通内容：" + fieldName + "=" + value);
                    // 上传文件
                }else{
                    // 获得文件大小
                    Long size = fileItem.getSize();
                    // 获得文件名
                    String fileName = fileItem.getName();
                    System.out.println("文件名："+fileName+"\t大小：" + size + "byte");
                    pictureURL="http://localhost:8080/index/imgs/"+fileName;

                    //设置不允许上传的文件格式
                    if(fileName.endsWith(".exe")){
                        req.setAttribute("msg", "不允许上传的类型！");
                    }else{
                        //将文件保存到指定的路径
                        File file = new File(savePath,fileName);
                        fileItem.write(file);
                        req.setAttribute("msg", "上传成功！");
                    }
                }
            }
        }catch(FileUploadBase.FileSizeLimitExceededException e){
            req.setAttribute("msg", "文件太大");
        }catch(FileUploadException e){
            e.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }
        MySQLDatabase mySQLDatabase=new MySQLDatabase();
        mySQLDatabase.insert_tbl_book(bookname,author,ownerID,publisher,price,comment, pictureURL);
        mySQLDatabase.FreeDatabase();
        resp.sendRedirect("manage.jsp");

    }

}
