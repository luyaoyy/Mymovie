package service;

import bean.Ticket;
import dao.TicketDaoImpl;

import java.sql.SQLException;
import java.util.List;

public class TicketServiceImpl implements TicketService{
    TicketDaoImpl ticketDao=new TicketDaoImpl();
    @Override
    public List<Ticket> selectTicketBymid(int mid) throws SQLException {
        return ticketDao.selectAllMovieBymid(mid);
    }

    @Override
    public int addTrice(int mid, int uid, String begtime, int seat, String room, String tprice ,String buytime) throws SQLException {
        return ticketDao.addTrick(mid,uid,begtime,seat,room,tprice,buytime);
    }

    @Override
    public List<Ticket> selectMyTicket(int uid) throws SQLException {
        return ticketDao.selectMyTicket(uid);
    }
}
