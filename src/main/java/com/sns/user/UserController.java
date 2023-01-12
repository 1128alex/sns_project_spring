package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.user.bo.UserBO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserBO userBO;

	@GetMapping("/login_view")
	public String loginView() {
		return "sns/login";
	}

	@GetMapping("/register_view")
	public String registerView() {
		return "sns/register";
	}

	@GetMapping("/check_duplication")
	public Map<String, Object> checkDuplication(@RequestParam("loginId") int loginId) {
		Boolean doesExist = userBO.checkDuplication(loginId);

		Map<String, Object> result = new HashMap<>();
		if (doesExist) {
			result.put("exist", true);
		} else if (doesExist == false) {
			result.put("exist", false);
		}

		return result;
	}
}
