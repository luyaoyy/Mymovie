package service;

import bean.Admin;
import bean.User;

import java.sql.SQLException;

public interface AdminService {
    Admin loginAdminBypassword(Admin admin) throws SQLException;
    Admin queryAdminByaname(String aname) throws SQLException;
    Admin queryAdminByaid(int aid) throws SQLException;
    Admin queryAdminBynameAndpwd(String name,String pwd) throws SQLException;
}
