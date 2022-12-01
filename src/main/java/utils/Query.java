package utils;

import bean.Movie;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import java.sql.SQLException;
import java.util.List;

public class Query {
    public static void main(String[] args) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<Movie>> h=new BeanListHandler<>(Movie.class);
        List<Movie> movies=run.query("select * from mymovie where mname=? and mclass=?", h,"1","1");
        System.out.println(movies);
    }
}
