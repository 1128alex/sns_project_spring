package com.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeDAO;

@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;

	public void addLike(int userId, int postId) {
		likeDAO.insertLike(userId, postId);
	}

	public int countLikeByPostId(int postId) {
		return likeDAO.countLikeByPostId(postId);
	}
}