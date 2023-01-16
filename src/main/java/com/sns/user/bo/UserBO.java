package com.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.user.dao.UserDAO;
import com.sns.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;

	public User getUserByLoginId(String loginId) {
		return userDAO.selectUserByLoginId(loginId);
	}

	public void addUserByLoginId(User user) {
		userDAO.insertUserByLoginId(user);
	}

	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}

}
