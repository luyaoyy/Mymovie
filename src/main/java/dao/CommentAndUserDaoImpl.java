package dao;

import bean.CommentAndUser;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.Dbutils;

import java.sql.SQLException;
import java.util.List;

public class CommentAndUserDaoImpl implements CommentAndUserDao{

    @Override
    public List<CommentAndUser> queryBymid(int mid) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<CommentAndUser>> h=new BeanListHandler<>(CommentAndUser.class);
        List<CommentAndUser> commentAndUsers=run.query("select * from comment c,user u where c.userid=u.uid and c.movieid=?",h,mid);
        return commentAndUsers;
    }

    @Override
    public int delCommentBycid(int cid) throws SQLException {
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        return run.update("delete from comment where cid=?",cid);
    }
}
