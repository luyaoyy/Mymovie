package bean;

public class CommentAndUser extends User{
    private int cid;
    private int userid;
    private int movieid;
    private String content;
    private String time;
    public CommentAndUser(){};

    public CommentAndUser(String uid, String username, String password, int gender, String nickname, String header, int cid, int userid, int movieid, String content, String time) {
        super(uid, username, password, gender, nickname, header);
        this.cid = cid;
        this.userid = userid;
        this.movieid = movieid;
        this.content = content;
        this.time = time;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "CommentAndUser{" +
                "cid=" + cid +
                ", userid=" + userid +
                ", movieid=" + movieid +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                "} " + super.toString();
    }
}
