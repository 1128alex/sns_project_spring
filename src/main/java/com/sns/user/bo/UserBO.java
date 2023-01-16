package com.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.user.dao.UserDAO;
import com.sns.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;

	public User checkDuplication(int loginId) {
		return userDAO.checkDuplication(loginId);
	}
}
