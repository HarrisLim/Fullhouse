package com.team.station4.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@RequestMapping(value="house/admin.do", method=RequestMethod.GET)
	public String manageroom() {
		return "house/admin";
	}
}