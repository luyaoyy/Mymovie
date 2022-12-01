package service;

import bean.Admin;
import dao.AdminDaoImpl;

import java.sql.SQLException;

public class AdminServiceImpl implements AdminService{
    AdminDaoImpl adminDao=new AdminDaoImpl();
    @Override
    public Admin loginAdminBypassword(Admin admin) throws SQLException {
        return adminDao.queryAdminBypassword(admin);
    }

    @Override
    public Admin queryAdminByaname(String aname) throws SQLException {
        return adminDao.queryAdminByaname(aname);
    }

    @Override
    public Admin queryAdminByaid(int aid) throws SQLException {
        return  adminDao.queryAdminByaid(aid);
    }

    @Override
    public Admin queryAdminBynameAndpwd(String name, String pwd) throws SQLException {
        return adminDao.queryAdminBynameAndpwd(name,pwd);
    }
}
