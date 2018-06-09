package MyPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class newsManagement
{
    public static String[][] getUser()
    {
        try
        {
            db dbcon = new db();
            String sql = "select * from pw where usr<>'游客' and usr<>'admin'";
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();
            String[][] str=new String[count][3];
            for(int i=0;i<count;i++)
            {
                rs.next();
                str[i][0]=rs.getString("usr");
                str[i][1]=rs.getString("pw");
                str[i][2]=rs.getString("auth");
            }
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static boolean delUser(String usr)
    {
        try
        {
            db dbcon = new db();
            String sql = "delete from pw where usr=?";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,usr);
            prest.executeUpdate();
            return true;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return false;
    }

    public static boolean setUser(String usr, String pw, int auth)
    {
        try
        {
            db dbcon = new db();
            String sql = "insert into pw values(?,?,?)";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,usr);
            prest.setString(2,pw);
            prest.setInt(3,auth);
            prest.executeUpdate();
            return true;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return false;
    }

    public static String[][] getNews()
    {
        try
        {

            db dbcon = new db();
            String sql = "select path,title,name from news where status=0";
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            String[][] str=new String[count][3];
            for(int i=0;i<count;i++)
            {
//                str[i][0]=rs.getString("path");
                str[i][1]=rs.getString("title");
                str[i][2]=rs.getString("name");
                rs.previous();
            }
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static String[][] getNewsAll()
    {
        try
        {

            db dbcon = new db();
            String sql = "select path,title,name from news";
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            String[][] str=new String[count][3];
            for(int i=0;i<count;i++)
            {
//                str[i][0]=rs.getString("path");
                str[i][1]=rs.getString("title");
                str[i][2]=rs.getString("name");
                rs.previous();
            }
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static String[][] getNews(int n)
    {
        try
        {

            db dbcon = new db();
            String sql = "select path,title,name from news where status=0 and cat="+n;
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            String[][] str=new String[count][3];
            for(int i=0;i<count;i++)
            {
//                str[i][0]=rs.getString("path");
                str[i][1]=rs.getString("title");
                str[i][2]=rs.getString("name");
                rs.previous();
            }
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static String[][] getNews(String title)
    {
        try
        {

            db dbcon = new db();
            String sql = "select path,title,name from news where status=0 and title like '%"+title+"%'";
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            String[][] str=new String[count][3];
            for(int i=0;i<count;i++)
            {
//                str[i][0]=rs.getString("path");
                str[i][1]=rs.getString("title");
                str[i][2]=rs.getString("name");
                rs.previous();
            }
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static String[][] getComments()
    {
        try
        {

            db dbcon = new db();
            String sql = "select * from comments";
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            String[][] str=new String[count][4];
            for(int i=0;i<count;i++)
            {
//                str[i][0]=rs.getString("path");
                str[i][0]=rs.getString("comment");
                str[i][1]=rs.getString("usr");
                str[i][2]=rs.getString("name");
                str[i][3]=rs.getString("time");
                rs.previous();
            }
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static String[][] getComments(String name)
    {
        try
        {

            db dbcon = new db();
            String sql = "select * from comments where name='"+name+"'";
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            String[][] str=new String[count][4];
            for(int i=0;i<count;i++)
            {
//                str[i][0]=rs.getString("path");
                str[i][0]=rs.getString("comment");
                str[i][1]=rs.getString("usr");
                str[i][2]=rs.getString("name");
                str[i][3]=rs.getString("time");
                rs.previous();
            }
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static boolean delComments(String time)
    {
        try
        {
            db dbcon = new db();
            String sql = "delete from comments where time=?";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,time);
            prest.executeUpdate();
            return true;
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        return false;
    }

    public static boolean setComments(String comment, String usr, String name)
    {
        try
        {
            comment = comment.replace("\r\n","<br>");
            comment = comment.replace("\r","<br>");
            db dbcon = new db();
            String time=std.getTime();
            String sql = "insert into comments values(?,?,?,?)";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,comment);
            prest.setString(2,usr);
            prest.setString(3,name);
            prest.setString(4,time);
            prest.executeUpdate();
            return true;
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        return false;
    }

    public static String[][] getNewsStatus()
    {
        try
        {

            db dbcon = new db();
            String sql = "select title,name,status from news";
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();
            String[][] str=new String[count][3];
            for(int i=0;i<count;i++)
            {
                rs.next();
                str[i][0]=rs.getString("title");
                str[i][1]=rs.getString("name");
                str[i][2]=Integer.toString(rs.getInt("status"));
            }
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static String[] getNewsPath(String name)
    {
        try
        {

            db dbcon = new db();
            String sql = "select * from news,category where name=? and news.cat=category.cat";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,name);
            ResultSet rs=prest.executeQuery();
            String[] str=new String[5];
            rs.next();
            str[0]=rs.getString("path");
            str[1]=rs.getString("title");
            str[2]=rs.getString("name");
            str[3]=rs.getString("catname");
            str[4]=rs.getString("usr");
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static String[][] getCategorys()
    {
        try
        {

            db dbcon = new db();
            String sql = "select cat,catname from category";
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();
            String[][] str=new String[count][2];
            for(int i=0;i<count;i++)
            {
                rs.next();
                str[i][0]=rs.getString("catname");
                str[i][1]=rs.getString("cat");
            }
            return str;
        }
        catch (Exception e)
        {
            e.toString();
        }
        return null;
    }

    public static boolean setNews(String title,String path,int cat,String user)
    {
        try
        {
            path = path.replace("\r\n","<br>");
            path = path.replace("\r","<br>");
            db dbcon = new db();
            int status=1;
            String time=std.getTime();
            String sql = "insert into news values(?,?,?,?,?,?)";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,path);
            prest.setString(2,user);
            prest.setInt(3,status);
            prest.setString(4,title);
            prest.setInt(5,cat);
            prest.setString(6,time);
            prest.executeUpdate();
            return true;
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        return false;
    }

    public static boolean setNewsStatus(String name)
    {
        try
        {
            db dbcon = new db();
            int status;
            String sql = "select status from news where name=?";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,name);
            ResultSet rs=prest.executeQuery();
            rs.next();
            status=rs.getInt("status");
            sql = "update news set status=? where name=?";
            prest = dbcon.PreparedStatement(sql);
            prest.setInt(1,1-status);
            prest.setString(2,name);
            prest.executeUpdate();
            return true;
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        return false;
    }

    public static boolean delNews(String name)
    {
        try
        {
            db dbcon = new db();
            String sql = "delete from comments where name=?";
            PreparedStatement prest = dbcon.PreparedStatement(sql);
            prest.setString(1,name);
            prest.executeUpdate();
            sql = "delete from news where name=?";
            prest = dbcon.PreparedStatement(sql);
            prest.setString(1,name);
            prest.executeUpdate();
            return true;
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        return false;
    }
}
