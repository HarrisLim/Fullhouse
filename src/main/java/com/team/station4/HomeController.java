package com.team.station4;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "refer/index.do", method = RequestMethod.GET)
	public String index() {
		return "refer/index";
	}
	
	@RequestMapping(value = "refer/home.do", method = RequestMethod.GET)
	public String home() {
		return "refer/home";
	}
	
	@RequestMapping(value = "refer/dashboard.do", method = RequestMethod.GET)
	public String dashBoard() {
		return "refer/dashboard";
	}
	
	@RequestMapping(value = "house/icons.do", method = RequestMethod.GET)
	public String icons() {
		return "refer/icons";
	}
	
	@RequestMapping(value = "house/notifications.do", method = RequestMethod.GET)
	public String notifications() {
		return "refer/notifications";
	}
	
	@RequestMapping(value = "house/tables.do", method = RequestMethod.GET)
	public String tables() {
		return "refer/tables";
	}
	
	@RequestMapping(value = "house/typography.do", method = RequestMethod.GET)
	public String typography() {
		return "refer/typography";
	}
	
	@RequestMapping(value = "house/upgrade.do", method = RequestMethod.GET)
	public String upgrade() {
		return "refer/upgrade";
	}
	
	@RequestMapping(value = "house/about.do", method = RequestMethod.GET)
	public String about() {
		return "refer/about";
	}
	
	@RequestMapping(value = "house/contact.do", method = RequestMethod.GET)
	public String contact() {
		return "refer/contact";
	}
	
	@RequestMapping(value = "house/homepage.do", method = RequestMethod.GET)
	public String homepage() {
		return "refer/homepage";
	}
	
	@RequestMapping(value = "house/user.do", method = RequestMethod.GET)
	public String user() {
		return "refer/user";
	}
	
	@RequestMapping(value = "house/signIn.do", method = RequestMethod.GET)
	public String signIn() {
		return "refer/signIn";
	}
    
	@RequestMapping(value = "house/map.do", method= RequestMethod.GET)
	public String mapPage() {
		return "house/map";
	}
}