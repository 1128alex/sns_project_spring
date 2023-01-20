package com.sns.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.comment.bo.CommentBO;
import com.sns.timeline.bo.TimelineBO;
import com.sns.timeline.model.CardView;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/post")
@Controller
public class TimelineController {
	@Autowired
	private TimelineBO timelineBO;

	@GetMapping("/timeline_view")
	public String postListView(Model model, HttpSession session) {
		String userLoginId = (String) session.getAttribute("userLoginId");

		List<CardView> cards = timelineBO.generateCardList();

		model.addAttribute("userLoginId", userLoginId);
		model.addAttribute("cards", cards);

		model.addAttribute("viewName", "timeline/timelineView");
		return "template/layout";
	}
}
