package dao;

import bean.Movie;
import bean.MyLoveMovieAndMovie;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.Dbutils;

import java.sql.SQLException;
import java.util.List;

public class MyLoveMovieDaoImple implements MyLoveMovieDao{

    @Override
    public List<MyLoveMovieAndMovie> selectLoveMovieByUid(int uid) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<MyLoveMovieAndMovie>> h=new BeanListHandler<>(MyLoveMovieAndMovie.class);
        List<MyLoveMovieAndMovie> movies=run.query("select * from mymovie m,mylovemovie l where m.id=l.movieid and l.userid=?",h,uid);
        return movies;
    }

    @Override
    public int insertIntoMyLovemovie(int uid, int mid) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        int row=run.update("insert into mylovemovie (userid,movieid) values (?,?)",uid,mid);
        return row;
    }

    @Override
    public int deleteMyLovemovieBylid(int lid) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        return run.update("delete from mylovemovie where lid=?",lid);
    }

}
