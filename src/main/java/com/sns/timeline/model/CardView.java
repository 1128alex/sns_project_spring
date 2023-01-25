package com.sns.timeline.model;

import java.util.List;

import com.sns.comment.model.CommentView;
import com.sns.post.model.Post;
import com.sns.user.model.User;

// View용 객체
public class CardView {
	// 글 1개
	private Post post;

	// 글쓴이 정보
	private User user;

	// 댓글들 N개
	private List<CommentView> comments;

	// 좋아요 개수
	private int likeCount;
	private boolean filledLike;

	// 내가(로그인 된 사람) 좋아요를 눌렀는지 filled like (boolean)

	public boolean isFilledLike() {
		return filledLike;
	}

	public void setFilledLike(boolean filledLike) {
		this.filledLike = filledLike;
	}

	public Post getPost() {
		return post;
	}

	public List<CommentView> getComments() {
		return comments;
	}

	public void setComments(List<CommentView> comments) {
		this.comments = comments;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
