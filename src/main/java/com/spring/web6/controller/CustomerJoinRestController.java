package com.spring.web6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.web6.dao.CustomerDAO;
import com.spring.web6.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("customer")
@Slf4j
public class CustomerJoinRestController {
	
	@Autowired
	CustomerDAO dao;
	
	@RequestMapping(value = "idcheck", method = RequestMethod.GET)
	public boolean idcheck(String id) {
		log.debug("id : {}", id);
		
		Customer customer = dao.get(id);
		log.debug("customer : {}", customer);
		if (customer != null) return false;
		
		return true;
	}
}
