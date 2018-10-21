package cn.edu.hbpu.animation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.mapper.UserMapper;
import cn.edu.hbpu.animation.pojo.User;
import cn.edu.hbpu.animation.pojo.UserExample;
import cn.edu.hbpu.animation.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	public UserMapper userMapper;
	
	public void batchDelUser(Integer[] uids) {
		userMapper.batchDelete(uids);
	}
	public void deleteUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
		
	}
	public void editUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}
	public PageInfo<User> getAllUser(int page, int limit) {
		PageHelper.startPage(page, limit);
		UserExample example = new UserExample();
		example.createCriteria().andIsdelEqualTo(0);
		List<User> list = userMapper.selectByExample(example);
		return new PageInfo<User>(list);
	}
	public List<User> getUserByUsername(String username) {
		UserExample example = new UserExample();
		example.createCriteria().andIsdelEqualTo(0).andUsernameLike("%"+username+"%");
		return userMapper.selectByExample(example);
	}
	public Boolean userLogin(Integer uid, String password) {
		User user = userMapper.selectByPrimaryKey(uid);
		if (user != null && user.getPassword().equals(password)) {
			return true;
		}else {
			return false;
		}
	}

}
