package dao.impl;

import dao.UserLoginDao;
import domain.User;
import domain.User_Login;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.List;

public class UserLoginImpl implements UserLoginDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public User_Login findUser(String username, String password) {
        try {
            String sql = "select * from user_login where username = ? and password = ?";
            User_Login user_login = template.queryForObject(sql, new BeanPropertyRowMapper<User_Login>(User_Login.class), username, password);
            return user_login;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public String findName(User_Login user_login) {
        String sql = "select * from user where id = ?";
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),user_login.getId());
        return user.getName();
    }
}
