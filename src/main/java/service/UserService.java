package service;

import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    User loginUserBypassword(String name,String pwd) throws SQLException;
    List<User> queryAllUser() throws SQLException;
    int deleteUserByid(int uid) throws SQLException;
}
