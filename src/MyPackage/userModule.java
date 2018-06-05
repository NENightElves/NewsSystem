package MyPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userModule
{
    public static boolean isUserExist(String user)
    {
        try
        {

            db dbcon = new db();
            String sql = "select * from pw where usr=?";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,user);
            ResultSet rs=prest.executeQuery();
            if (rs.next()) return true; else return false;
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        return false;
    }

    public static boolean isLoginSuc(String user, String pw)
    {
        try
        {

            db dbcon = new db();
            String sql = "select * from pw where usr=? and pw=?";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,user);
            prest.setString(2,pw);
            ResultSet rs=prest.executeQuery();
            if (rs.next()) return true; else return false;
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        return false;
    }

    public static int getUsrAuth(String user)
    {
        try
        {

            db dbcon = new db();
            String sql = "select auth from pw where usr=?";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,user);
            ResultSet rs=prest.executeQuery();
            return rs.getInt("auth");
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        return -1;
    }

    public static void setUsr(String user, String pw)
    {
        try
        {

            db dbcon = new db();
            String sql = "insert into pw values(?,?,?)";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,user);
            prest.setString(2,pw);
            prest.setInt(3,10);
            prest.executeUpdate();
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
    }
}
