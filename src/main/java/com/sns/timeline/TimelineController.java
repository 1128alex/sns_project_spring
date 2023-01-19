package com.sns.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.Comment;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;

@RequestMapping("/post")
@Controller
public class TimelineController {
	@Autowired
	private PostBO postBO;
	@Autowired
	private CommentBO commentBO;

	@GetMapping("/timeline_view")
	public String postListView(Model model) {
		List<Post> posts = postBO.getPostList();
		List<Comment> comments = commentBO.getCommentByPostId();
		model.addAttribute("posts", posts);
		model.addAttribute("viewName", "timeline/timelineView");
		return "template/layout";
	}
}
