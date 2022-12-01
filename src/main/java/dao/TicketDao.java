package dao;

import bean.Ticket;

import java.sql.SQLException;
import java.util.List;

public interface TicketDao {
    List<Ticket> selectAllMovieBymid(int mid) throws SQLException;
    int addTrick(int mid,int uid,String begtime,int seat,String room,String tprice,String buytime) throws SQLException;
    List<Ticket> selectMyTicket(int uid) throws SQLException;
}
