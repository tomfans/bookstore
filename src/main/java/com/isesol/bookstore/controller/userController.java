package com.isesol.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.sym.Name;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.isesol.bookstore.POJO.Msg;
import com.isesol.bookstore.POJO.User;
import com.isesol.bookstore.dao.redisCacheManager;
import com.isesol.bookstore.service.userService;

@Controller
public class userController {

	@Autowired
	@Qualifier(value = "userServiceImpl")
	private userService service;
	
	@Autowired
	private redisCacheManager redisCacheManager;

	@RequestMapping("/addUser.do")
	public String addUser(User user, Model model) {

		boolean mark = service.addUser(user);

		if (mark) {

			model.addAttribute("info", "成功");
		} else {

			model.addAttribute("info", "失败");
		}

		return "jsp/user_info";

	}

	@RequestMapping("/user_list.do")
	@ResponseBody
	public Msg user_list(@RequestParam(value = "pn", defaultValue = "1") Integer pn, User user) {
		PageHelper.startPage(pn, 5);
		List<User> list = service.getUserList(user);
		PageInfo pageInfo = new PageInfo(list, 5);
		return Msg.Success().add("Pageinfo", pageInfo).add("product", redisCacheManager.get("product"));

	}

	/*
	 * @RequestMapping("/user_list.do") public String
	 * user_list(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
	 * User user, HttpServletRequest request, Model model) {
	 * 
	 * PageHelper.startPage(pn, 5); List<User> list = service.getUserList(user);
	 * PageInfo pageInfo = new PageInfo(list, 5); model.addAttribute("pageInfo",
	 * pageInfo); model.addAttribute("user", user);
	 * 
	 * return "jsp/user_list";
	 * 
	 * }
	 */

	@ResponseBody
	@RequestMapping("/user_list_test.do")
	public PageInfo user_list_test(@RequestParam(value = "pn", defaultValue = "1") Integer pn, User user,
			HttpServletRequest request, Model model) {

		PageHelper.startPage(pn, 5);
		List<User> list = service.getUserList(user);
		PageInfo pageInfo = new PageInfo(list, 5);
		return pageInfo;
	}

	@RequestMapping("/user_update.do")
	public String loadUpdate(User user, Model model) {

		User user2 = service.getUser(user);

		model.addAttribute("user", user2);
		return "jsp/update_list";
	}

	@RequestMapping("/updateUser.do")
	public String updateUser(User user, Model model) {

		boolean mark = service.updateUser(user);

		if (mark) {

			model.addAttribute("info", "成功");
		} else {

			model.addAttribute("info", "失败");
		}

		return "jsp/user_info";

	}

	@RequestMapping("/user_delete.do")
	public String deleteUser(User user, Model model) {

		boolean mark = service.deleteUser(user);

		if (mark) {

			model.addAttribute("info", "成功");
		} else {

			model.addAttribute("info", "失败");
		}

		return "jsp/user_info";
	}
}
