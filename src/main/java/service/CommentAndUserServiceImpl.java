package service;

import bean.CommentAndUser;
import dao.CommentAndUserDaoImpl;

import java.sql.SQLException;
import java.util.List;

public class CommentAndUserServiceImpl implements CommentAndUserService{
    CommentAndUserDaoImpl commentAndUserDao=new CommentAndUserDaoImpl();
    @Override
    public List<CommentAndUser> queryBymid(int mid) throws SQLException {
        return commentAndUserDao.queryBymid(mid);
    }

    @Override
    public int delComment(int cid) throws SQLException {
        return  commentAndUserDao.delCommentBycid(cid);
    }
}
