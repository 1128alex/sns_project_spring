package com.sns.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentDAO;
import com.sns.comment.model.Comment;

@Service
public class CommentBO {
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

}
