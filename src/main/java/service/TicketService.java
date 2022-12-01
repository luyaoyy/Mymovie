package service;

import bean.Ticket;

import java.sql.SQLException;
import java.util.List;

public interface TicketService {
    List<Ticket> selectTicketBymid(int mid) throws SQLException;
    int addTrice(int mid, int uid, String begtime, int seat, String room, String tprice,String buytime) throws SQLException;
    List<Ticket> selectMyTicket(int uid) throws SQLException;
}
