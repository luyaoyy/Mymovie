package dao;

import bean.Movie;
import bean.MyLoveMovieAndMovie;

import java.sql.SQLException;
import java.util.List;

public interface MyLoveMovieDao {
    List<MyLoveMovieAndMovie> selectLoveMovieByUid(int uid) throws SQLException;
    int insertIntoMyLovemovie(int uid,int mid) throws SQLException;
    int deleteMyLovemovieBylid(int lid) throws SQLException;
}
