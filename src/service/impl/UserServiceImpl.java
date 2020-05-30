package service.impl;

import dao.UserDao;
import dao.UserLoginDao;
import dao.impl.UserDaoImpl;
import dao.impl.UserLoginImpl;
import domain.PageBean;
import domain.User;
import domain.User_Login;
import service.UserService;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private UserDao dao = new UserDaoImpl();
    private UserLoginDao login = new UserLoginImpl();

    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public User_Login findUser(String username, String password) {
        return login.findUser(username,password);
    }

    @Override
    public String findName(User_Login user_login) {
        return login.findName(user_login);
    }

    @Override
    public void addUser(User user) {
        dao.addUser(user);
    }

    @Override
    public void delUser(int id) {
        dao.delUser(id);
    }

    @Override
    public User findUser(int id) {
        return dao.findUser(id);
    }

    @Override
    public void updateUser(User user) {
        dao.updateUser(user);
    }

    @Override
    public void delSelected(String[] ids) {
        for (String id : ids) {
            dao.delUser(Integer.parseInt(id));
        }
    }

    @Override
    public PageBean<User> findUserByPage(String currentPage, int rows, Map<String, String[]> condition) {
        PageBean<User> pb = new PageBean<User>();

        pb.setRows(5);

        int count = dao.totalCount(condition);
        pb.setTotalCount(count);


        int totalPage = count%rows == 0 ? count/rows : count/rows+1;
        pb.setTotalPage(totalPage);

        int cp = Integer.parseInt(currentPage);
        cp = cp<1 ? 1 : cp;
        cp = cp>totalPage ? totalPage : cp;

        pb.setCurrentPage(cp);

        List<User> list = dao.findUserByPage((cp-1)*rows, rows, condition);
        pb.setList(list);


        return pb;
    }


}
