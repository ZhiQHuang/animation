package cn.edu.hbpu.animation.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.animation.pojo.User;
import cn.edu.hbpu.animation.service.UserService;

@Controller
@RequestMapping("/admin/demo")
public class UserController {
	@Autowired
	private UserService userService;
	
	//分页获取用户列表
	@RequestMapping("/getAllUser")
	@ResponseBody
	public Map<String, Object> getAllUser(int page, int limit) {
		PageInfo<User> pageInfo = userService.getAllUser(page, limit);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", pageInfo.getTotal());
		result.put("data", pageInfo.getList());
		
		return result ;
	}
	
	//删除用户
	@RequestMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(User user) {
		user.getUid();
		user.setIsdel(1);
		userService.deleteUser(user);
		return "ok";
	}
	
	//批量删除用户
	@RequestMapping("/batchDelUser")
	@ResponseBody
	public void batchDelUser(Integer[] uids) {
		userService.batchDelUser(uids);
	}
	
	//查找用户
	@RequestMapping("/searchUser")
	@ResponseBody
	public Map<String, Object> searchUser(String username) {
		String content = "";
		try {
			content = URLDecoder.decode(username, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<User> list = userService.getUserByUsername(content);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", list.size());
		result.put("data", list);
		return result;
	}
	
	//修改用户
	@RequestMapping("/editUser")
	@ResponseBody
	public void editUser(User user) {
		userService.editUser(user);
	}
}
