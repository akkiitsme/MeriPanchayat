package com.user;


import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

	@Autowired UserDao userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		UserBean userBean = new UserBean();
		System.out.println("username :"+username);
		if(!Pattern.matches("^[0-9]*$", username)) {
			userBean = userDao.findByUsername(username);
		} else {
			userBean = userDao.findByMobileNo(username);
		}
		if(userBean==null) {
			System.out.println("User not found");
			throw new UsernameNotFoundException("No user Found");
		}	
		return userBean;
	}

}
