package service;

import bean.Movie;
import bean.MyLoveMovieAndMovie;
import dao.MyLoveMovieDaoImple;

import java.sql.SQLException;
import java.util.List;

public class MyLoveMovieServiceImpl implements MyLoveMovieService{
    MyLoveMovieDaoImple myLoveMovieDaoImple=new MyLoveMovieDaoImple();
    @Override
    public List<MyLoveMovieAndMovie> selectLoveMovieByUid(int uid) throws SQLException {
        return myLoveMovieDaoImple.selectLoveMovieByUid(uid);
    }

    @Override
    public int insertintoMyLovemovie(int uid, int mid) throws SQLException {
        return myLoveMovieDaoImple.insertIntoMyLovemovie(uid,mid);
    }

    @Override
    public int deleteLoveMovieBylid(int lid) throws SQLException {
        return myLoveMovieDaoImple.deleteMyLovemovieBylid(lid);
    }

}
