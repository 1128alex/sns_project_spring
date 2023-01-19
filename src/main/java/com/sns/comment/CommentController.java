package com.sns.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.comment.bo.CommentBO;

@RequestMapping("/comment")
@Controller
public class CommentController {
	@Autowired
	private CommentBO commentBO;

	@GetMapping("/delete_comment")
	public String deleteComment(@RequestParam("commentId") int commentId) {

		commentBO.deleteCommentById(commentId);

		return "redirect:/post/timeline_view";
	}
}
