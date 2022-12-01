package service;

import bean.Movie;
import bean.MyLoveMovieAndMovie;

import java.sql.SQLException;
import java.util.List;

public interface MyLoveMovieService {
    List<MyLoveMovieAndMovie> selectLoveMovieByUid(int uid) throws SQLException;
    int insertintoMyLovemovie(int uid,int mid) throws SQLException;
    int deleteLoveMovieBylid(int lid) throws SQLException;
}
