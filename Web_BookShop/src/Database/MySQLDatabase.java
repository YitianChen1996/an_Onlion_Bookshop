package Database;

import java.sql.*;

/**
 * Created by chenyitian on 17-5-12.
 */
public class MySQLDatabase {
    Connection connection=null;
    Statement statement=null;
    ResultSet resultSet=null;

    public ResultSet getResultSet() {
        return resultSet;
    }

    public MySQLDatabase(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/BookShop_Database?useUnicode=true&characterEncoding=UTF-8",
                    "root","18980848315");
            statement=connection.createStatement();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void insert_tbl_User(String studentID, String password, String username, String email){
        String sql="insert into user(studentID,password,username,emailaddr) " +
               "value("+"\"" +studentID +"\""+","+
                "\""+password+"\""+","+
                "\""+username+"\""+","+
                "\""+email+"\""+")";
        excuteSQL(sql);
    }

    public void insert_tbl_book(String bookname,String author, String ownerID,
                                String publisher, double price, String comment, String pictureURL){
        String sql="insert into tbl_book(bookname,author,ownerID,publisher,price,comment,pictureURL) " +
                "value("+"\""+bookname+"\""+","+
                "\""+author+"\""+","+
                "\""+ownerID+"\""+","+
                "\""+publisher+"\""+","+
                +price+","+
                "\""+comment+"\""+","+
                "\""+pictureURL+"\""+")";
        excuteSQL(sql);
    }

    public void insert_tbl_shoppingcart(String studentID, String bookname){
        String sql="insert into shoppingcart(ownerID, bookname)" +
                " value(\""+studentID+"\",\""+bookname+"\")";
        excuteSQL(sql);
    }

    public void delete_from_shoppingcart(String studentID,String bookname){
        String sql="delete from shoppingcart where " +
                "(ownerID=\""+studentID+"\" and bookname=\""+bookname+"\")";
        excuteSQL(sql);
    }

    public void excuteSQL(String sql){
        try {
            statement=connection.createStatement();
            int count=statement.executeUpdate(sql);
            //System.out.println("插入了"+count+"个数据");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void Query(String sql){
        try {
            resultSet=statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void FreeDatabase(){
        try {
            if (resultSet!=null){
                resultSet.close();
            }
            if (statement!=null){
                statement.close();
            }
            if (connection!=null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
