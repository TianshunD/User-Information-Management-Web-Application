package util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * JDBC Utils For using durid datasource and JDBCtemplate
 */
public class JDBCUtils {

    private static DataSource ds ;

    static {

        try {
            //1.load config
            Properties pro = new Properties();
            //ClassLoader -> fis
            InputStream is = JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties");
            pro.load(is);

            //2.int datasource
            ds = DruidDataSourceFactory.createDataSource(pro);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Get datasource
     */
    public static DataSource getDataSource(){
        return ds;
    }


    /**
     * get Connection object
     */
    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
}
