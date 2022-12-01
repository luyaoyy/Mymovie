package service;

import bean.CommentAndUser;

import java.sql.SQLException;
import java.util.List;

public interface CommentAndUserService {
    List<CommentAndUser> queryBymid(int mid) throws SQLException;
    int delComment(int cid) throws SQLException;
}
