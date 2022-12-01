package service;

import bean.User;
import dao.UserDao;
import dao.UserDaoImpl;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserDaoImpl userDao=new UserDaoImpl();
    @Override
    public User loginUserBypassword(String name,String pwd) throws SQLException {
        return userDao.queryUserBypassword(name,pwd);
    }

    @Override
    public List<User> queryAllUser() throws SQLException {
        return userDao.queryAll();
    }

    @Override
    public int deleteUserByid(int uid) throws SQLException {
        return userDao.deleteByid(uid);
    }
}
