package dao;

import domain.User;
import domain.User_Login;

import java.util.List;

public interface UserLoginDao {
    public User_Login findUser(String username, String password);
    public String findName(User_Login user_login);
}
