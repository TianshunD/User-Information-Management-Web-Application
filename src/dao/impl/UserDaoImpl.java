package dao.impl;

import dao.UserDao;
import domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UserDaoImpl implements UserDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<User> findAll() {
        String sql = "select * from user";
        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
        return users;
    }

    @Override
    public void addUser(User user) {
        String sql = "insert into user values (null,?,?,?,?,?,?)";
        template.update(sql,user.getName(),user.getGender(),user.getAge(),user.getAddress(),user.getQq(),user.getEmail());
    }

    @Override
    public void delUser(int id) {
        //Cannot delete or update a parent row: a foreign key constraint fails, so delete child first
        String sql1 = "delete from user_login where id = ?";
        template.update(sql1,id);

        String sql2 = "delete from user where id = ?";
        template.update(sql2,id);
    }

    @Override
    public User findUser(int id) {
        String sql = "select * from user where id = ?";
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
        return user;
    }

    @Override
    public void updateUser(User user) {
        String sql = "update user set gender=?, age=?, address=?, qq=?, email=? where id=?";
        template.update(sql,user.getGender(),user.getAge(),user.getAddress(),user.getQq(),user.getEmail(),user.getId());
    }

    @Override
    public int totalCount(Map<String, String[]> condition) {
        String sql_tmp = "select count(*) from user where 1=1 ";
        StringBuilder sb = new StringBuilder(sql_tmp);

        //iter map to append condition
        Set<String> keySet = condition.keySet();
        List<Object> params = new ArrayList<>();
        for (String key : keySet) {
            if (!"currentPage".equals(key)) {
                String value = condition.get(key)[0];

                if(value!=null && !("".equals(value))) {
                    sb.append(" and " + key +" like ? ");
                    params.add("%" + value + "%");
                }
            }

        }
        System.out.println(sb.toString()); //select count(*) from user where 1=1  and name like ?
        System.out.println(params); //[%sam%]

        return template.queryForObject(sb.toString(), Integer.class, params.toArray());
    }

    @Override
    public List<User> findUserByPage(int start, int rows, Map<String, String[]> condition) {
        String sql_tmp = "select * from user where 1=1 ";
        StringBuilder sb = new StringBuilder(sql_tmp);

        //iter map to append condition
        Set<String> keySet = condition.keySet();
        List<Object> params = new ArrayList<>();
        for (String key : keySet) {
            if (!"currentPage".equals(key)) {
                String value = condition.get(key)[0];

                if(value!=null && !("".equals(value))) {
                    sb.append(" and " + key +" like ? ");
                    params.add("%" + value + "%");
                }
            }

        }
        sb.append(" limit ?,?");

        //I set (cp-1)*rows in UserServiceImpl to be no less than 0, somehow it will give -5, so I have to reset here
        start = start<0 ? 0:start;
        params.add(start);
        params.add(rows);

        System.out.println(sb.toString());
        System.out.println(params);

        List<User> list = template.query(sb.toString(), new BeanPropertyRowMapper<User>(User.class), params.toArray());
        return list;
    }

}
