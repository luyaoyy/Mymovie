package dao;

import bean.Admin;
import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.Dbutils;

import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao{

    @Override
    public Admin queryAdminBypassword(Admin admin) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<Admin> h=new BeanHandler<>(Admin.class);
        Admin ad=run.query("select * from admin where aname=? and apassword=?",h,admin.getAname(),admin.getApassword());
        return ad;
    }

    @Override
    public Admin queryAdminByaname(String aname) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<Admin> h=new BeanHandler<>(Admin.class);
        Admin ad=run.query("select * from admin where aname=? and apassword=?",h,aname);
        return ad;
    }

    @Override
    public Admin queryAdminByaid(int aid) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<Admin> h=new BeanHandler<>(Admin.class);
        Admin ad=run.query("select * from admin where aid=? ",h,aid);
        return ad;
    }

    @Override
    public Admin queryAdminBynameAndpwd(String name, String pwd) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<Admin> h=new BeanHandler<>(Admin.class);
        Admin ad=run.query("select * from admin where aname=? and apassword=? ",h,name,pwd);
        return ad;
    }
}
