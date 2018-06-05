package MyPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

public class db
{
    private Connection dbConn;
    private Statement stateMent;
    public db()
    {
        String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String dbURL="jdbc:sqlserver://101.132.146.78:1433;DatabaseName=NewsSystem";
        String userName="sa";
        String userPwd="Bb@321456";
        try
        {
            Class.forName(driverName);
            dbConn=DriverManager.getConnection(dbURL, userName, userPwd);
//			System.out.println("Connection Successful!");
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
    }
    public int executeUpdate(String sql) throws SQLException
    {
        stateMent = dbConn.createStatement();
        return stateMent.executeUpdate(sql);
    }
    public ResultSet executeQuery(String sql) throws SQLException
    {
        stateMent=dbConn.createStatement();
        return stateMent.executeQuery(sql);
    }
    public void closeConn() throws SQLException
    {
        stateMent.close();
        dbConn.close();
    }
    public PreparedStatement PreparedStatement(String sql) throws SQLException
    {
        return  dbConn.prepareStatement(sql);
    }

}