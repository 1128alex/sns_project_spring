package com.sns.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@GetMapping("/post_list_view")
	public String postListView(Model model) {
		model.addAttribute("viewName", "post/postListView");
		return "template/layout";
	}
}
