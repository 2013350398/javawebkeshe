package com.zc;

//import static org.junit.Assert.assertTrue;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 * Borrow test for simple App.
 */
public class AppTest {
    private static Connection dbConn = null;

    public static void main(String[] args) {
        String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=education";

        try {
            //1.加载驱动
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("加载驱动成功！");
            //2.连接
            dbConn = DriverManager.getConnection(dbURL, "sa", "20021001");
            System.out.println("连接数据库成功！");

//            String sql="select * from people";
//            PreparedStatement statement=null;
//            statement=dbConn.prepareStatement(sql);
//            ResultSet res=null;
//            res=statement.executeQuery();
//            while(res.next()){
//                String title=res.getString("name");
//                System.out.println(title);
//            }
        }catch(Exception e) {
            e.printStackTrace();
            System.out.println("连接数据库失败！");
        }

    }
}
