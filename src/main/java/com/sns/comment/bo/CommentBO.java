package com.sns.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentDAO;
import com.sns.comment.model.Comment;
import com.sns.comment.model.CommentView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class CommentBO {
	@Autowired
	private UserBO userBO;
	@Autowired
	private CommentDAO commentDAO;

	public void addComment(int postId, int userId, String comment) {
		commentDAO.insertComment(postId, userId, comment);
	}

	public List<Comment> getCommentList() {
		return commentDAO.selectCommentList();
	}

	public int deleteCommentById(int id) {
		return commentDAO.deleteCommentById(id);
	}

	public List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}

	// input: 글번호
	// output: 글번호에 해당하는 댓글목록(+댓글쓴이 정보)을 가져온다.
	public List<CommentView> generateCommentViewByPostId(int postId) {
		// 결과물
		List<CommentView> commentViews = new ArrayList<>();

		// 댓글 목록
		List<Comment> comments = getCommentListByPostId(postId);

		// 반복문 => CommentView => 결과물에 넣는다.
		for (int i = 0; i < comments.size(); i++) {
			CommentView commentView = new CommentView();
			commentView.setComment(comments.get(i));

			User user = userBO.getUserById(comments.get(i).getUserId());
			commentView.setUser(user);

			commentViews.add(commentView);
		}

		// 결과물 리턴
		return commentViews;
	}
}
