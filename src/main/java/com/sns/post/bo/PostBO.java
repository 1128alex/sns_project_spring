package com.sns.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.comment.dao.CommentDAO;
import com.sns.common.FileManagerService;
import com.sns.like.dao.LikeDAO;
import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;

@Service
public class PostBO {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private CommentDAO commentDAO;

	@Autowired
	private LikeDAO likeDAO;

	@Autowired
	private FileManagerService fileManagerService;

	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {

		String imagePath = null;

		if (file != null) {
			imagePath = fileManagerService.saveFile(userLoginId, file);
		}

		return postDAO.insertPost(userId, content, imagePath);
	}

	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}

	public Post getPostByPostIdUserId(int postId, int userId) {
		return postDAO.getPostByPostIdUserId(postId, userId);

	}

	public int deletePostByPostIdUserId(int postId, int userId) {
		// 기존글 가져오기
		Post post = getPostByPostIdUserId(postId, userId);
		if (post == null) {
			logger.warn("[글 삭제] post is null. postId:{}, userId:{}", postId, userId);
			return 0;
		}

		// 이미지 있으면 이미지 삭제
		if (post.getImagePath() != null) {
			fileManagerService.deleteFile(post.getImagePath());
		}

		// 글삭제
		int a = postDAO.deletePostByPostIdUserId(postId, userId);
		if (a != 1) {
			logger.warn("[글 삭제] postDAO.deletePostByPostIdUserId 실패");
		}
		// 댓글들 삭제
		int b = commentDAO.deleteCommentsByPostId(postId);

		// 좋아요들 삭제
		int c = likeDAO.deleteLikesByPostId(postId);

		return 1;
	}
}
