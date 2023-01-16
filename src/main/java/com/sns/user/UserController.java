package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@RequestMapping("/user")
@Controller
public class UserController {
	/**
	 * 회원가입 화면
	 * 
	 * @param model
	 * @return
	 */

	@Autowired
	private UserBO userBO;

	@GetMapping("/sign_up_view")
	public String registerView(Model model) {
		model.addAttribute("viewName", "user/signUp");
		return "template/layout";
	}
	
	/**
	 * 로그인 화면
	 * 
	 * @param model
	 * @return
	 */
	

	@GetMapping("/sign_in_view")
	public String loginView(Model model) {
		model.addAttribute("viewName", "user/signIn");
		return "template/layout";
	}

	@ResponseBody
	@PostMapping("/check_duplication")
	public Map<String, Object> checkDuplication(@RequestParam("loginId") int loginId) {
		User user = userBO.checkDuplication(loginId);

		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("exist", true);
		} else if (user == null) {
			result.put("exist", false);
		}

		return result;
	}
}
