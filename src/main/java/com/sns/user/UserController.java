package com.sns.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.user.bo.UserBO;

import jakarta.servlet.http.HttpSession;

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

	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");

		return "redirect:/user/sign_in_view";
	}

}
