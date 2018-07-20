package com.team.station4.proinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProinfoController {

	@RequestMapping(value="house/proinfo.do", method=RequestMethod.GET)
	public String proinfo() {
		return "house/proinfo";
	}
}
