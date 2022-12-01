package bean;

public class Movie {
    private int id;
    private String mname;
    private String mclass;
    private String mpeople;
    private String mduration;
    private String mactor;
    private String mnation;
    private  String mprice;
    private String mtime;
    private String mgrade;
    private String mintroduce;
    private String mimg;

    public Movie() {
    }

    public Movie(int id, String mname, String mclass, String mpeople, String mduration, String mactor, String mnation, String mprice, String mtime, String mgrade, String mintroduce, String mimg) {
        this.id = id;
        this.mname = mname;
        this.mclass = mclass;
        this.mpeople = mpeople;
        this.mduration = mduration;
        this.mactor = mactor;
        this.mnation = mnation;
        this.mprice = mprice;
        this.mtime = mtime;
        this.mgrade = mgrade;
        this.mintroduce = mintroduce;
        this.mimg = mimg;
    }

    public Movie(String mname, String mclass, String mpeople, String mduration, String mactor, String mnation, String mprice, String mtime, String mgrade, String mintroduce, String mimg) {
        this.mname = mname;
        this.mclass = mclass;
        this.mpeople = mpeople;
        this.mduration = mduration;
        this.mactor = mactor;
        this.mnation = mnation;
        this.mprice = mprice;
        this.mtime = mtime;
        this.mgrade = mgrade;
        this.mintroduce = mintroduce;
        this.mimg = mimg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMclass() {
        return mclass;
    }

    public String getMactor() {
        return mactor;
    }

    public void setMactor(String mactor) {
        this.mactor = mactor;
    }

    public void setMclass(String mclass) {
        this.mclass = mclass;
    }

    public String getMpeople() {
        return mpeople;
    }

    public void setMpeople(String mpeople) {
        this.mpeople = mpeople;
    }

    public String getMnation() {
        return mnation;
    }

    public String getMduration() {
        return mduration;
    }

    public void setMduration(String mduration) {
        this.mduration = mduration;
    }





    public void setMnation(String mnation) {
        this.mnation = mnation;
    }

    public String getMprice() {
        return mprice;
    }

    public void setMprice(String mprice) {
        this.mprice = mprice;
    }

    public String getMtime() {
        return mtime;
    }

    public void setMtime(String mtime) {
        this.mtime = mtime;
    }

    public String getMgrade() {
        return mgrade;
    }

    public void setMgrade(String mgrade) {
        this.mgrade = mgrade;
    }

    public String getMintroduce() {
        return mintroduce;
    }

    public void setMintroduce(String mintroduce) {
        this.mintroduce = mintroduce;
    }

    public String getMimg() {
        return mimg;
    }

    public void setMimg(String mimg) {
        this.mimg = mimg;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "id=" + id +
                ", mname='" + mname + '\'' +
                ", mclass='" + mclass + '\'' +
                ", mpeople='" + mpeople + '\'' +
                ", mduration='" + mduration + '\'' +
                ", mactor='" + mactor + '\'' +
                ", mnation='" + mnation + '\'' +
                ", mprice='" + mprice + '\'' +
                ", mtime='" + mtime + '\'' +
                ", mgrade='" + mgrade + '\'' +
                ", mintroduce='" + mintroduce + '\'' +
                ", mimg='" + mimg + '\'' +
                '}';
    }
}
