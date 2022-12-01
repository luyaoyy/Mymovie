package utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class Dbutils {
    private static ComboPooledDataSource cpds;
    static {
        cpds=new ComboPooledDataSource();
    }
    public static ComboPooledDataSource getDateSource() {
        return cpds;
    }
}
