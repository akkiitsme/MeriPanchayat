package com.user;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired UserDao userDao;
	@Autowired RoleDAO roleDao;
	
	
	//for creating the user
	public UserBean insertUser(UserBean userBean,Set<UserRoleBean> userRoles) {
		
		UserBean tempBean =  userDao.findByUsername(userBean.getUsername());
		if(tempBean!=null) {
			System.out.println("User Already Exists !");
			return tempBean;
		} else {
			for(UserRoleBean roleBean : userRoles) {
				roleDao.save(roleBean.getRole());
			}
			userBean.getUserRoles().addAll(userRoles);
			userDao.save(userBean).getClass();
			return userBean;
		}	
		
	}
}
