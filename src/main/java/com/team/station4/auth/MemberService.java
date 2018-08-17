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
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.staff.model.service.StaffService;

public class MemberService implements UserDetailsService{
	@Autowired MainService mainService;
	@Autowired StaffService staffService;

	@Override
	public UserDetails loadUserByUsername(String mem_email) throws UsernameNotFoundException {
		
		UserDetails user = null;
		MainDTO empw = mainService.getUsersByID(mem_email);
		System.out.println("empw값 : " + empw );
		
		if (empw == null) {
				String st_email = mem_email;
				StaffDTO empw2 = staffService.getUsersByID(st_email);
				System.out.println(" 스태프 이름 : " + empw2.getSt_name() );
				Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
				roles.add(new SimpleGrantedAuthority("Staff"));	
				user =  new User(st_email, empw2.getSt_pw(), roles);
		}
		if (empw != null) {
			if( empw.getMem_name().contains("#9") ) {
				System.out.println(" 운영자 이름 : " + empw.getMem_name() );
				Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
				roles.add(new SimpleGrantedAuthority("ADMIN"));	
				user =  new User(mem_email, empw.getMem_pw(), roles);
			}else if ( empw.getMem_name().contains("#1") ) {
				System.out.println(" 일반 회원 이름 : " + empw.getMem_name() );
				Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			     roles.add(new SimpleGrantedAuthority("USER"));
			     user = new User(mem_email, empw.getMem_pw(), roles);
			}
		}
		return user;
	}
}
