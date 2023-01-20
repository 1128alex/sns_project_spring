package com.sns.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	public void insertLike(@Param("userId") int userId, @Param("postId") int postId);

	public int countLikeByPostId(int postId);
}
