package MyPackage;

import java.text.SimpleDateFormat;
import java.util.Date;

public class std
{
    public static String getTime()
    {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        Date currentTime=new Date();
        return simpleDateFormat.format(currentTime).toString();
    }
}
