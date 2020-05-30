package dao;

import domain.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    public List<User> findAll();
    public void addUser(User user);
    public void delUser(int id);
    public User findUser(int id);
    public void updateUser(User user);
    public int totalCount(Map<String, String[]> condition);
    public List<User> findUserByPage(int start, int rows, Map<String, String[]> condition);
}
