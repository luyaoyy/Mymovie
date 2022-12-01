package dao;

import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.Dbutils;

import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements UserDao{
    @Override
    public User queryUserBypassword(String name,String pwd) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        User us=new User();
        ResultSetHandler<User> h=new BeanHandler<>(User.class);
        us=run.query("select * from user where username=? and password=?",h,name,pwd);
        return us;
    }

    @Override
    public List<User> queryAll() throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<User>> h=new BeanListHandler<>(User.class);
        List<User> users =run.query("select * from user",h);
        return users;
    }

    @Override
    public int deleteByid(int uid) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        int row=run.update("delete from user where uid=?",uid);
        return row;
    }
}
