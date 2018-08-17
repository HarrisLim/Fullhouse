package com.team.station4.injection.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.injection.model.dao.InjectionDAO;
import com.team.station4.map.model.BuildDTO;

@Service
public class InjectionServiceImpl implements InjectionService {
	@Autowired
	InjectionDAO dao;
	
	@Override
	public int myMaxService() {
		return dao.myMax();
	}

	 @Override
	 public List<Double>randomLat(int count){
		 List<Double>randomLat = new ArrayList<Double>();
		 // 38.56840795178768, 130.525309690136 //고성
		 // 34.36648681811837, 126.09912791740395 //진도
		 // 35.12310061655682, 129.05650821802078 // 부산
		 // 37.792602855680975, 126.5212847590806 //강화도
		 Random r = new Random();
		 //전국
		 //double start = 34.36648681811837;
		 //double end = 38.56840795178768;
		 //수도권
		 double start = 37.35787318799519;
		 double end = 37.8347415116356;
		 double range = end-start;
		 for (int i=0; i<count; i++) {
			 double lat = r.nextDouble() * range + start;
			 System.out.println("lat: "+lat);
			 randomLat.add(lat);
		 }
		 return randomLat;
	 }
	 
	 @Override
	 public List<Double>randomLng(int count){
		 List<Double>randomLng = new ArrayList<Double>();
		 Random r = new Random();
		 //전국
		 //double start = 126.09912791740395;
		 //double end = 130.525309690136;
		 //수도권
		 double start = 126.60845644761866;
		 double end = 127.65287076386323;
		 
		 double range = end-start;
		 for (int i=0; i<count; i++) {
			 double lng = r.nextDouble() * range + start;
			 System.out.println("lng: "+lng);
			 randomLng.add(lng);
		 }

		 return randomLng;
	 }
	 
	 @Override
	 public void insertInjectionService(BuildDTO dto) {
		 dao.insertInjection(dto);
	 }
	 
	 @Override
	 public void insertPriceService(HashMap price) {
		 dao.insertPrice(price);
	 }
	 
	 @Override
	 public int countService() {
		 return dao.count();
	 }

	 @Override
	 public void InsertAddInfoService(HashMap addInfo) {
		 dao.InsertAddInfo(addInfo);
	 }
}
