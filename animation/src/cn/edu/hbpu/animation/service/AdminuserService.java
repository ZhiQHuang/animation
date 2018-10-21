package cn.edu.hbpu.animation.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.Adminuser;

public interface AdminuserService {
	
	Boolean adminLogin(Integer adminid, String password);

	PageInfo<Adminuser> getAllAdminuser(int page, int limit);

	void insertAdminuser(Adminuser adminuser);

	void deleteAdminuser(Adminuser adminuser);

	List<Adminuser> getAdminuserByName(String adminname);

	void batchDelAdminuser(Integer[] adminIds);

	void editAdminuser(Adminuser adminuser);
}
