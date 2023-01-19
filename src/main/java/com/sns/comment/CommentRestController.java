package com.sns.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.comment.bo.CommentBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/comment")
@RestController
public class CommentRestController {
	@Autowired
	private CommentBO commentBO;

	@GetMapping("/create_comment")
	public Map<String, Object> createComment(@RequestParam("postId") int postId,
			@RequestParam("comment") String comment, HttpSession session) {
		int userId = (int) session.getAttribute("userId");

		commentBO.addComment(postId, userId, comment);

		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");

		return result;
	}
}
