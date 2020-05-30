package service;

import domain.PageBean;
import domain.User;
import domain.User_Login;

import java.util.List;
import java.util.Map;

public interface UserService {
    /**
     * find all users' info
     * @return
     */
    public List<User> findAll();

    public User_Login findUser(String username, String password);

    public String findName(User_Login user_login);

    public void addUser(User user);

    public void delUser(int id);

    public User findUser(int id);

    public void updateUser(User user);

    public void delSelected(String[] ids);

    /**
     * pagination by condition
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    public PageBean<User> findUserByPage(String currentPage, int rows, Map<String, String[]> condition);
}
