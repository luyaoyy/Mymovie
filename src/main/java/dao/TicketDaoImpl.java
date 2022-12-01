package dao;

import bean.Ticket;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.Dbutils;

import java.sql.SQLException;
import java.util.List;

public class TicketDaoImpl implements TicketDao{
    @Override
    public List<Ticket> selectAllMovieBymid(int mid) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<Ticket>> h=new BeanListHandler<>(Ticket.class);
        List<Ticket> tickets=run.query("select * from ticket where movid=?",h,mid);
        return tickets;
    }

    @Override
    public int addTrick(int mid, int uid, String begtime, int seat, String room, String tprice,String buytime) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        int row=run.update("insert into ticket(movid,useid,begtime,seat,room,tprice,buytime) values (?,?,?,?,?,?,?)",mid,uid,begtime,seat,room,tprice,buytime);
        return row;
    }

    @Override
    public List<Ticket> selectMyTicket(int uid) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<Ticket>> h=new BeanListHandler<>(Ticket.class);
        List<Ticket> tickets=run.query("select * from ticket t,mymovie m where t.movid=m.id and useid=?",h,uid);
        return tickets;
    }
}
