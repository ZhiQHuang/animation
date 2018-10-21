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

import cn.edu.hbpu.animation.pojo.Type;
import cn.edu.hbpu.animation.service.TypeService;

@Controller
@RequestMapping("/admin/demo")
public class TypeController {
	@Autowired
	private TypeService typeService;
	
	//分页获取分类列表
	@RequestMapping("/getAllType")
	@ResponseBody
	public Map<String, Object> getAlltype(int page, int limit) {
		PageInfo<Type> pageInfo = typeService.getAllType(page, limit);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", pageInfo.getTotal());
		result.put("data", pageInfo.getList());
		
		return result ;
	}
	
	//获取所有分类
	@RequestMapping("/getType")
	@ResponseBody
	public List<Type> getType() {
		return typeService.getType();
	}
	
	//插入分类
	@RequestMapping("/insertType")
	@ResponseBody
	public String insertType(Type type) {
		typeService.insertType(type);
		return "ok";
	}
	
	//删除分类
	@RequestMapping("/deleteType")
	@ResponseBody
	public String deleteType(Type type) {
		type.getTid();
		type.setIsdel(1);
		typeService.deleteType(type);
		return "ok";
	}
	
	//批量删除分类
	@RequestMapping("/batchDelType")
	@ResponseBody
	public void batchDelType(Integer[] tids) {
		typeService.batchDelType(tids);
	}
	
	//查找分类
	@RequestMapping("/searchType")
	@ResponseBody
	public Map<String, Object> searchType(String tname) {
		String content = "";
		try {
			content = URLDecoder.decode(tname, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Type> list = typeService.getTypeByTname(content);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", list.size());
		result.put("data", list);
		return result;
	}
	
	//修改分类
	@RequestMapping("/editType")
	@ResponseBody
	public void editType(Type type) {
		typeService.editType(type);
	}
}










