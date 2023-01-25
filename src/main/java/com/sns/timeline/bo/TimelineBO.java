package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.CommentView;
import com.sns.like.bo.LikeBO;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.timeline.model.CardView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class TimelineBO {
	@Autowired
	private PostBO postBO;
	@Autowired
	private UserBO userBO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private LikeBO likeBO;

	// 로그인이 되지 않은 사람도 카드 목록이 보여야 한다.
	public List<CardView> generateCardList(Integer userId) {

		List<CardView> cardViewList = new ArrayList<>();

		// 글목록 가져오기 (post)
		List<Post> posts = postBO.getPostList();

		// postList 반복문 => CardView => cardViewList에 넣는다.
		for (int i = 0; i < posts.size(); i++) {
			CardView card = new CardView();
			card.setPost(posts.get(i));
			User user = userBO.getUserById(posts.get(i).getUserId());
			List<CommentView> comments = commentBO.generateCommentViewByPostId(posts.get(i).getId());
			card.setFilledLike(likeBO.existLike(posts.get(i).getUserId(), userId));
			card.setLikeCount(likeBO.getLikeCountByPostId(posts.get(i).getUserId()));

			card.setUser(user);
			card.setComments(comments);
			cardViewList.add(card);
		}

		return cardViewList;
	}
}
