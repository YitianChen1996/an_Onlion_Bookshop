package Utilities;

import Database.MySQLDatabase;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by chenyitian on 17-5-20.
 */
public class Utilities {
    public static boolean alreadyInShoppingcart(String studentID,String bookname){
        MySQLDatabase mySQLDatabase=new MySQLDatabase();
        mySQLDatabase.Query("select * from shoppingcart where " +
                "(ownerID=\""+studentID+"\" and bookname=\""+bookname+"\")");
        ResultSet resultSet=mySQLDatabase.getResultSet();
        try {
            while(resultSet.next()){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
