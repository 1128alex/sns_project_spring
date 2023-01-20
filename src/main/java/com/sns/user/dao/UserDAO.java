package com.sns.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.user.model.User;

@Repository
public interface UserDAO {

	public User selectUserByLoginId(String loginId);

	public void insertUserByLoginId(User user);

	public User selectUserByLoginIdPassword(@Param("loginId") String loginId, @Param("password") String password);

	public User selectUserById(int userId);

}
