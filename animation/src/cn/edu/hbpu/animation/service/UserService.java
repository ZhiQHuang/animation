package cn.edu.hbpu.animation.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.User;

public interface UserService {

	PageInfo<User> getAllUser(int page, int limit);
	
	void deleteUser(User user);
	
	List<User> getUserByUsername(String username);
	
	void batchDelUser(Integer[] uids);
	
	void editUser(User user);
	
	Boolean userLogin(Integer uid, String password);
}
