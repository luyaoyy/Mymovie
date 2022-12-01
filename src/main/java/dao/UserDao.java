package dao;

import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    User queryUserBypassword(String name,String pwd) throws SQLException;
    List<User> queryAll() throws SQLException;
    int deleteByid(int uid) throws SQLException;
}
