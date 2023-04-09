package com.circular;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CircularDao extends JpaRepository<CircularBean, Integer> {
	
	public List<CircularBean> findByStatusOrderByCircularIdDesc(Integer status);

	public CircularBean findByCircularId(int circularId);

}
