package com.team.station4.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.team.station4.main.model.MainDTO;
import com.team.station4.main.model.service.MainService;

public class MemberService implements UserDetailsService{
	@Autowired MainService mainService;

	@SuppressWarnings("null")
	@Override
	public UserDetails loadUserByUsername(String mem_email) throws UsernameNotFoundException {
		UserDetails user = null;
		MainDTO empw = mainService.getUsersByID(mem_email);
		
		if( empw.getMem_name().contains("#9") ) {
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			roles.add(new SimpleGrantedAuthority("ROLE_USER"));	
			user = new User(mem_email, empw.getMem_pw(), roles);
		}else if ( empw.getMem_name().contains("#1") ) {
			
		}
		/*if (empw == null) {
			throw new UsernameNotFoundException("No user found with username" 
															+ empw.getMem_name());
		}*/
		return user;
	}
}
