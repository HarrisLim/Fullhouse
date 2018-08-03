package com.team.station4.promain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PromainController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "house/promain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String promain() {
		return "house/promain";
	}
	@RequestMapping(value = "house/projoin.do", method = RequestMethod.GET)
	public String promem() {
		return "house/projoin";
	}
}
