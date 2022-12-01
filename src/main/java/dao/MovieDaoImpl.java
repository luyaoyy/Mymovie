package dao;

import bean.Movie;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.Dbutils;

import java.sql.SQLException;
import java.util.List;

public class MovieDaoImpl implements MovieDao{
    @Override
    public List<Movie> selectAll() throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<Movie>> h=new BeanListHandler<>(Movie.class);
        List<Movie> movies=run.query("select * from mymovie",h);
        return movies;
    }

    @Override
    public int deleteByid(int id) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        int row =run.update("delete from mymovie where id=?",id);
        return row;
    }

    @Override
    public List<Movie> selectBymname(String mname) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<Movie>> h=new BeanListHandler<>(Movie.class);
        List<Movie> movies=run.query("select * from mymovie where mname like concat('%',?,'%')",h,mname);//模糊查询语句,concat拼接
        return movies;
    }

    @Override
    public Movie selectByid(int id) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<Movie> h=new BeanHandler<>(Movie.class);
        Movie movie=run.query("select * from mymovie where id=?",h,id);
        return movie;
    }
    @Override
    public List<Movie> selectBymclass(String mclass) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<Movie>> h=new BeanListHandler<>(Movie.class);
        List<Movie> movies=run.query("select * from mymovie where mclass=?",h,mclass);
        return movies;
    }

    @Override
    public List<Movie> selectByPager(String mname, int pageIndex, int pageCount) throws SQLException {
        List<Movie> movies;
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<Movie>> h=new BeanListHandler<>(Movie.class);
        if(mname!=null){
            movies=run.query("select * from mymovie where mname like concat('%',?,'%') limit ?,?",h,mname,(pageIndex-1)*pageCount,pageCount);
        }else {
            movies=run.query("select * from mymovie limit ?,?",h,(pageIndex-1)*pageCount,pageCount);
        }
        return movies;
    }

    @Override
    public int updateMovieById(Movie movie) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        int row=run.update("update mymovie set mactor=?,mduration=?,mname=?,mclass=?,mpeople=?,mnation=?,mprice=?,mtime=?,mgrade=?,mintroduce=? where id=?",movie.getMactor(),movie.getMduration(),movie.getMname(), movie.getMclass(), movie.getMpeople(), movie.getMnation(), movie.getMprice(), movie.getMtime(), movie.getMgrade(), movie.getMintroduce(),movie.getId());
        return row;
    }

    @Override
    public int selectCount(String mname) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<Movie>> h=new BeanListHandler<>(Movie.class);
        List<Movie> movies;
        if(mname!=null){
            movies=run.query("select * from mymovie where mname like concat('%',?,'%')",h,mname);
        }else {
            movies=run.query("select * from mymovie",h);
        }
        return movies.size();
    }

}
