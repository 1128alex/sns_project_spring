package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.common.EncryptUtils;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestContoller {
	@Autowired
	private UserBO userBO;

	@PostMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(@RequestParam("loginId") String loginId) {
		User user = userBO.getUserByLoginId(loginId);

		Map<String, Object> result = new HashMap<>();
		if (user == null) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "존재하는 사용자입니다.");
		}

		return result;
	}

	@PostMapping("/sign_up")
	public Map<String, Object> signUp(@ModelAttribute User user) {
		userBO.addUserByLoginId(user);

		String hashedPassword = EncryptUtils.md5(user.getPassword());
		user.setPassword(hashedPassword);

		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");

		return result;

	}

	@PostMapping("/sign_in")
	public Map<String, Object> signIn(@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {

		User user = userBO.getUserByLoginIdPassword(loginId, password);

		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
		}

		return result;
	}

}
