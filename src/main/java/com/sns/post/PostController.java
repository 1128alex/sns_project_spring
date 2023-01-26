package com.sns.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.bo.PostBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/post")
@Controller
public class PostController {

	@Autowired
	private PostBO postBO;

	@PostMapping("/create_post")
	@ResponseBody
	public Map<String, Object> createPost(@RequestParam("content") String content,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpSession session) {

		int userId = (int) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");

		int rowCount = postBO.addPost(userId, userLoginId, content, file);

		Map<String, Object> result = new HashMap<>();

		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
			result.put("userLoginId", userLoginId);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "게시물을 올리는데 실패했습니다.");
		}

		return result;

	}

	@DeleteMapping("/delete")
	@ResponseBody
	public Map<String, Object> deletePost(@RequestParam("postId") int postId, HttpSession session) {
		int userId = (int) session.getAttribute("userId");

		int rowCount = postBO.deletePostByPostIdUserId(postId, userId);

		Map<String, Object> result = new HashMap<>();

		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "삭제를 실패했습니다.(PostController)");
		}

		return result;

	}
}
