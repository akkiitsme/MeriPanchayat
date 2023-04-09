package com.circular;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CircularService {
	
	@Autowired CircularDao circularDao;

	public String insertCircular(CircularBean circularBean) {
		// TODO Auto-generated method stub
		try {
			circularBean.setCreatedOn(new Date());
			circularBean.setStatus(1);
			circularDao.save(circularBean);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}

	}

	public Boolean deleteCircular(int circularId) {
		// TODO Auto-generated method stub
		try {
			CircularBean circularBean = circularDao.findByCircularId(circularId);
			circularBean.setStatus(0);
			circularDao.save(circularBean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public List<CircularBean> getAllCircularList() {
		List<CircularBean> circularList = circularDao.findByStatusOrderByCircularIdDesc(1);
		try {
		String generateLink = "http://localhost:8080/documents/";
		for(CircularBean cBean : circularList) {
			cBean.setFile(generateLink+cBean.getCircularNo()+".pdf");
		}
		return circularList;
		} catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

}
