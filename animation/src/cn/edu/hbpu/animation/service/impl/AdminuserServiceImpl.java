package cn.edu.hbpu.animation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.mapper.AdminuserMapper;
import cn.edu.hbpu.animation.pojo.Adminuser;
import cn.edu.hbpu.animation.pojo.AdminuserExample;
import cn.edu.hbpu.animation.service.AdminuserService;

@Service
public class AdminuserServiceImpl implements AdminuserService {
	@Autowired
	public AdminuserMapper adminuserMapper;

	public Boolean adminLogin(Integer adminid, String password) {

		Adminuser adminuser = adminuserMapper.selectByPrimaryKey(adminid);
		if (adminuser != null && adminuser.getPassword().equals(password)) {
			return true;
		} else
			return false;

	}

	public void batchDelAdminuser(Integer[] adminIds) {
		adminuserMapper.batchDelete(adminIds);
	}

	public void deleteAdminuser(Adminuser adminuser) {
		adminuser.setIsdel(1);
		adminuserMapper.updateByPrimaryKeySelective(adminuser);
		
	}

	public void editAdminuser(Adminuser adminuser) {
		adminuserMapper.updateByPrimaryKeySelective(adminuser);
	}

	public List<Adminuser> getAdminuserByName(String adminname) {
		AdminuserExample example = new AdminuserExample();
		example.createCriteria().andIsdelEqualTo(0).andAdminnameLike("%"+adminname+"%");
		return adminuserMapper.selectByExample(example);
	}

	public PageInfo<Adminuser> getAllAdminuser(int page, int limit) {
		PageHelper.startPage(page, limit);
		AdminuserExample example = new AdminuserExample();
		example.createCriteria().andIsdelEqualTo(0).andTypeEqualTo(1);
		List<Adminuser> list = adminuserMapper.selectByExample(example);
		return new PageInfo<Adminuser>(list);
		
	}

	public void insertAdminuser(Adminuser adminuser) {
		adminuserMapper.insertSelective(adminuser);
	}


}
