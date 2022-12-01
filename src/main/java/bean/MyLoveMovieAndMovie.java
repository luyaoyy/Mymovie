package bean;

public class MyLoveMovieAndMovie extends Movie {
    private int lid;
    private int userid;
    private int movieid;

    public MyLoveMovieAndMovie(){};
    public MyLoveMovieAndMovie(int lid, int userid, int movieid) {
        this.lid = lid;
        this.userid = userid;
        this.movieid = movieid;
    }

    public MyLoveMovieAndMovie(int id, String mname, String mclass, String mpeople, String mduration, String mactoe, String mnation, String mprice, String mtime, String mgrade, String mintroduce, String mimg, int lid, int userid, int movieid) {
        super(id, mname, mclass, mpeople, mduration, mactoe, mnation, mprice, mtime, mgrade, mintroduce, mimg);
        this.lid = lid;
        this.userid = userid;
        this.movieid = movieid;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getMovieid() {
        return movieid;
    }

    public void setMovieid(int movieid) {
        this.movieid = movieid;
    }

    @Override
    public String toString() {
        return "MyLoveMovieAndMovie{" +
                "lid=" + lid +
                ", userid=" + userid +
                ", movieid=" + movieid +
                "} " + super.toString();
    }
}
