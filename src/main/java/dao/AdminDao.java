package dao;

import bean.Admin;

import java.sql.SQLException;

public interface AdminDao {
    Admin queryAdminBypassword(Admin admin) throws SQLException;
    Admin queryAdminByaname(String aname) throws SQLException;
    Admin queryAdminByaid(int aid) throws SQLException;
    Admin queryAdminBynameAndpwd(String name,String pwd) throws SQLException;
}
