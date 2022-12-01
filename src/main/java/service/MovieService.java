package service;

import bean.Movie;
import utils.PagerResult;

import java.sql.SQLException;
import java.util.List;

public interface MovieService {
    List<Movie> queryAllMovie() throws SQLException;
    int deletemovieByid(int id) throws SQLException;
    Movie selectMovieByid(int id) throws SQLException;
    List<Movie> selectMovidBymname(String mname) throws SQLException;
    List<Movie> selectMovieBymclass(String mclass) throws SQLException;
    PagerResult queryPager(String name, int pageIndex, int pageCount) throws SQLException;
    int updateMovieById(Movie movie) throws SQLException;
}
