package com.team.station4.promanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PromanageController {
	@RequestMapping(value="house/promanage.do", method=RequestMethod.GET)
	public String proinfo() {
		return "house/promanage";
	}
}
