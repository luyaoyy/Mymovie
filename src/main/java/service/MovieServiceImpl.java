package service;

import bean.Movie;
import dao.MovieDaoImpl;
import utils.PagerResult;

import java.sql.SQLException;
import java.util.List;

public class MovieServiceImpl implements MovieService{
    MovieDaoImpl movieDao=new MovieDaoImpl();
    @Override
    public List<Movie> queryAllMovie() throws SQLException {
        return movieDao.selectAll();
    }

    @Override
    public int deletemovieByid(int id) throws SQLException {
        return  movieDao.deleteByid(id);
    }

    @Override
    public Movie selectMovieByid(int id) throws SQLException {
        return movieDao.selectByid(id);
    }

    @Override
    public List<Movie> selectMovidBymname(String mname) throws SQLException {
        return movieDao.selectBymname(mname);
    }

    @Override
    public List<Movie> selectMovieBymclass(String mclass) throws SQLException {
        return movieDao.selectBymclass(mclass);
    }

    @Override
    public PagerResult queryPager(String name, int pageIndex, int pageCount) throws SQLException {
        List<Movie> movies=movieDao.selectByPager(name,pageIndex,pageCount);
        int dataCount=movieDao.selectCount(name);
        int pageNum=0;
        if(dataCount%pageCount==0){
            pageNum=dataCount/pageCount;
        }else{
            pageNum=dataCount/pageCount+1;
        }
        PagerResult pagerResult = new PagerResult(pageIndex,pageCount,dataCount,pageNum,movies);
        return pagerResult;
    }

    @Override
    public int updateMovieById(Movie movie) throws SQLException {
        return movieDao.updateMovieById(movie);
    }

}
