package MyPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class newsManagement
{
    public static String[][] getNews()
    {
        try
        {

            db dbcon = new db();
            String sql = "select path,title,name from news";
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();
            String[][] str=new String[count][3];
            for(int i=0;i<count;i++)
            {
                rs.next();
                str[i][0]=rs.getString("path");
                str[i][1]=rs.getString("title");
                str[i][2]=rs.getString("name");
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
            String sql = "select path,title,name from news where cat="+n;
            ResultSet rs = dbcon.executeQuery(sql);
            rs.last();
            int count = rs.getRow();
            rs.beforeFirst();
            String[][] str=new String[count][3];
            for(int i=0;i<count;i++)
            {
                rs.next();
                str[i][0]=rs.getString("path");
                str[i][1]=rs.getString("title");
                str[i][2]=rs.getString("name");
            }
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

}
