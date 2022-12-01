package dao;

import bean.Movie;

import java.sql.SQLException;
import java.util.List;

public interface MovieDao {
    List<Movie> selectAll() throws SQLException;
    int deleteByid(int id) throws SQLException;
    List<Movie> selectBymname(String mname) throws SQLException;
    Movie selectByid(int id) throws SQLException;
    List<Movie> selectBymclass(String mclass) throws SQLException;
    List<Movie> selectByPager(String mname,int pageIndex,int pageCount) throws SQLException;
    int updateMovieById(Movie movie) throws SQLException;
    int selectCount(String mname) throws SQLException;
}
