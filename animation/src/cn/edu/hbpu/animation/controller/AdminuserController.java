package cn.edu.hbpu.animation.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.Adminuser;
import cn.edu.hbpu.animation.service.AdminuserService;

@Controller
@RequestMapping("/admin")
public class AdminuserController {
	@Autowired
	private AdminuserService adminuserService;

	@RequestMapping("/adminLogin")
	@ResponseBody
	public String adminLogin(Adminuser admin, HttpSession session) {
		Boolean login = adminuserService.adminLogin(admin.getAdminid(), admin
				.getPassword());
		if (login) {
			session.setAttribute("adminuser", admin.getAdminid());
			return "index";
		}
		return "adminLogin";
	}
	
	//分页获取用户列表
	@RequestMapping("/getAllAdminuser")
	@ResponseBody
	public Map<String, Object> getAllAdminuser(int page, int limit) {
		PageInfo<Adminuser> pageInfo = adminuserService.getAllAdminuser(page, limit);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", pageInfo.getTotal());
		result.put("data", pageInfo.getList());
		
		return result ;
	}
	
	//插入用户
	@RequestMapping("/insertAdminuser")
	@ResponseBody
	public String insertAdminuser(Adminuser adminuser) {
		adminuser.setType(1);
		adminuserService.insertAdminuser(adminuser);
		return "ok";
	}
	
	//删除用户
	@RequestMapping("/deleteAdminuser")
	@ResponseBody
	public String deleteAdminuser(Adminuser adminuser) {
		adminuser.getAdminid();
		adminuserService.deleteAdminuser(adminuser);
		return "ok";
	}
	
	//批量删除用户
	@RequestMapping("/batchDelAdminuser")
	@ResponseBody
	public void batchDelType(Integer[] adminIds) {
		adminuserService.batchDelAdminuser(adminIds);
	}
	
	//查找用户
	@RequestMapping("/searchAdminuser")
	@ResponseBody
	public Map<String, Object> searchType(String adminname) {
		String content = "";
		try {
			content = URLDecoder.decode(adminname, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Adminuser> list = adminuserService.getAdminuserByName(content);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", list.size());
		result.put("data", list);
		return result;
	}
	
	//修改用户
	@RequestMapping("/editAdminuser")
	@ResponseBody
	public void editAdminuser(Adminuser adminuser) {
		adminuserService.editAdminuser(adminuser);
	}
	
}
