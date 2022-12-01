package dao;

import bean.CommentAndUser;

import java.sql.SQLException;
import java.util.List;

public interface CommentAndUserDao {
    List<CommentAndUser> queryBymid(int mid) throws SQLException;
    int delCommentBycid(int cid) throws SQLException;
}
