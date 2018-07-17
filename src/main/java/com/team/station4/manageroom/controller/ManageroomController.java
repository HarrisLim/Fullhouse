package com.team.station4.manageroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManageroomController {

	@RequestMapping(value="house/manageroom.do", method=RequestMethod.GET)
	public String manageroom() {
		return "house/manageroom";
	}
}
