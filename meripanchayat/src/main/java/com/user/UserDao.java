package com.user;


import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<UserBean, Integer> {
	
    UserBean findByUsername(String username);

	UserBean findByMobileNo(String username);

	UserBean findByUsernameAndPassword(String username, String password);
}
