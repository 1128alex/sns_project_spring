package com.sns.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.sns.like.bo.LikeBO;

import jakarta.servlet.http.HttpSession;

@RestController
public class LikeRestController {
	@Autowired
	private LikeBO likeBO;

	// wildcard
	// /like?postId=13 @requestParam
	// /like/13 @PathVariable
	@GetMapping("/like/{postId}")
	public Map<String, Object> like(@PathVariable int postId, HttpSession session) {
		int userId = (int) session.getAttribute("userId");

		Map<String, Object> result = new HashMap<>();

		likeBO.addLike(userId, postId);

		result.put("code", 1);

		return result;
	}
}
