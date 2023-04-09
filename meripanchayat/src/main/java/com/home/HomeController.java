package com.home;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.user.RoleBean;
import com.user.UserBean;
import com.user.UserDao;
import com.user.UserRoleBean;
import com.user.UserService;

@Controller
public class HomeController {
	
	@Autowired UserDao userDao;
	@Autowired UserService userService;
	
	@RequestMapping(value={"/"}) 
	public String homePage() {
		return "homePage";
	}
	
	@RequestMapping(value={"/login"}) 
	public String loginPage() {
		String login = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
		if(login.equals("anonymousUser"))
			return "login";
		else
			return "redirect:/dashboard";
	}
	
	@RequestMapping(value={"/signup"}) 
	public String signUpPage(@ModelAttribute("user") UserBean userBean,HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		session.setAttribute("phoneValidity",0);
		return "registration";
	}
	
	@RequestMapping(value={"/dashboard"}) 
	public String dasboardPage(Model model) {
		UserBean login = (UserBean)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", login);
		System.out.println("userCredentials:"+login.getId());
		return "dashboard";
	}
	
	@RequestMapping(value={"/adduser"})
	public String createUser(@ModelAttribute UserBean userBean) {
		try {
			System.out.println(userBean);
			Set<UserRoleBean> roles = new HashSet<>();
			RoleBean roleBean = new RoleBean();
			//setting up the user roles
			if(!userBean.getUserType().equals("0")) {
				roleBean.setRoleId(1);
				roleBean.setRoleName("publicUser");
			} else {
				roleBean.setRoleId(2);
				roleBean.setRoleName("officialUser");
			}		
			UserRoleBean userRoleBean = new UserRoleBean();
			userRoleBean.setRole(roleBean);
			userRoleBean.setUser(userBean);
			roles.add(userRoleBean);
			//insert the user data into database
			userService.insertUser(userBean, roles);
			return "redirect:login";
		} catch (Exception e ) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value={"/ajaxCheckUser"}) 
	public @ResponseBody String ajaxUserCheck(@RequestParam("username") String username,@RequestParam("password") String password ) {

		System.out.println("ajax userName : "+username);
		UserBean userBean = new UserBean();
		if(!Pattern.matches("^[0-9]*$", username)) {
			userBean = userDao.findByUsernameAndPassword(username,password);
		} else {
			userBean = userDao.findByMobileNo(username);
		}
		if(userBean==null) {
			System.out.println("User not found");
			return "0";
		} else	
			return "1";
	}
	
	@RequestMapping(value={"/ajaxCheckUserValid"}) 
	public @ResponseBody String ajaxUserCheckValid(@RequestParam("username") String username) {

		System.out.println("ajax userName : "+username);
		UserBean userBean = new UserBean();
		if(!Pattern.matches("^[0-9]*$", username)) {
			userBean = userDao.findByUsername(username);
		} else {
			userBean = userDao.findByMobileNo(username);
		}
		if(userBean==null) {
			System.out.println("User not found");
			return "0";
		} else	
			return "1";
	}
	@RequestMapping(value={"/ajaxCheckPhoneNo"}) 
	public @ResponseBody String ajaxCheckPhoneNo(@RequestParam("phone") String phoneNo) {
		System.out.println("ajax phone number : "+phoneNo);
		UserBean userBean = userDao.findByMobileNo(phoneNo);
		if(userBean==null) {
			System.out.println("Number Not Found");
			return "0";
		} else	{
			return "1";
		}
	}
	
	
	@RequestMapping(value={"/access-denied"})
	public String AccessDenied() {
		return "accessDenied";
	}
	

}
