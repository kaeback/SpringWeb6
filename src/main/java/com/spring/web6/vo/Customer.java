package com.spring.web6.vo;

import lombok.Data;

@Data
public class Customer {
	private String custid;
	private String password;
	private String name;
	private String email;
	private String gender;
	private String ssn;
	private String address;
}
