package bean;

public class Ticket extends Movie{
    private int tid;
    private int movid;
    private int useid;
    private String begtime;
    private String seat;
    private String room;
    private String tprice;
    private String buytime;
    private int status;
    public Ticket(){};

    public Ticket(int tid, int movid, int useid, String begtime, String seat, String room, String tprice, String buytime) {
        this.tid = tid;
        this.movid = movid;
        this.useid = useid;
        this.begtime = begtime;
        this.seat = seat;
        this.room = room;
        this.tprice = tprice;
        this.buytime = buytime;
    }

    public Ticket(String mname, String mclass, String mpeople, String mduration, String mactoe, String mnation, String mprice, String mtime, String mgrade, String mintroduce, String mimg) {
        super(mname, mclass, mpeople, mduration, mactoe, mnation, mprice, mtime, mgrade, mintroduce, mimg);
    }

    public Ticket(int id, String mname, String mclass, String mpeople, String mduration, String mactoe, String mnation, String mprice, String mtime, String mgrade, String mintroduce, String mimg, int tid, int movid, int useid, String begtime, String seat, String room, String tprice, String buytime, int status) {
        super(id, mname, mclass, mpeople, mduration, mactoe, mnation, mprice, mtime, mgrade, mintroduce, mimg);
        this.tid = tid;
        this.movid = movid;
        this.useid = useid;
        this.begtime = begtime;
        this.seat = seat;
        this.room = room;
        this.tprice = tprice;
        this.buytime = buytime;
        this.status = status;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getMovid() {
        return movid;
    }

    public void setMovid(int movid) {
        this.movid = movid;
    }

    public int getUseid() {
        return useid;
    }

    public void setUseid(int useid) {
        this.useid = useid;
    }

    public String getBegtime() {
        return begtime;
    }

    public void setBegtime(String begtime) {
        this.begtime = begtime;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getTprice() {
        return tprice;
    }

    public void setTprice(String tprice) {
        this.tprice = tprice;
    }

    public String getBuytime() {
        return buytime;
    }

    public void setBuytime(String buytime) {
        this.buytime = buytime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "tid=" + tid +
                ", movid=" + movid +
                ", useid=" + useid +
                ", begtime='" + begtime + '\'' +
                ", seat='" + seat + '\'' +
                ", room='" + room + '\'' +
                ", tprice='" + tprice + '\'' +
                ", buytime='" + buytime + '\'' +
                ", status=" + status +
                "} " + super.toString();
    }
}
