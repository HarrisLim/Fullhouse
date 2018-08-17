package com.team.station4.map.model.service;

import java.awt.Color;

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.model.dao.MapDAO;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.room.model.RequestDTO;
import com.team.station4.uploadroom.model.PriceDTO;

@Service
public class MapServiceImpl implements MapService {
	@Autowired
	MapDAO dao;
	
	@Override
	public List<BuildDTO> mapListService(Map jsonLatLng){
		return dao.mapList(jsonLatLng);
	}
	
	 @Override
	 public int countClusterService(Map jsonLatLng) {
		 return dao.countCluster(jsonLatLng);
	 }

	@Override
	public List<BuildDTO> locationService(){
		return dao.location();
	}
	
	@Override
	public List<BuildDTO> latLngService(HashMap hm){
		return dao.latLng(hm);
	}
	
	@Override
	public void makeImage(int count) {
		  long startTime = System.currentTimeMillis();
		  String subject = Integer.toString(count);
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		  Date date = new Date();
		  //File makeImage = new File("C:/Pictures/saveImage/saveImage" + sdf.format(date) + ".png");
		  File makeImage = new File("C:/Pictures/saveImage/totalMarker.png");
		  print("saved New image name : " + makeImage.toString());
		  File loadImage = new File("C:/Pictures/loadImage/custom_marker.png");
		  BufferedImage bi = null;
		  try {
			  bi = ImageIO.read(loadImage);
		  } catch (IOException e) {
			  print("이미지 불러오다가 에러 나쓔..ㅜㅜ");
			  e.printStackTrace();
		  }
		  int imgWidth = bi.getWidth();
		  int imgHeight = bi.getHeight();
		  print("loadImage\nwidth : " + imgWidth + ", height : " + imgHeight);
		  Graphics2D g2 = null;
		  g2 = bi.createGraphics();
		  // text에 적용할 폰트 생성, 아래 폰트는 시스템에 설치 되어 있어야 사용할 수 있음
		  Font font = new Font("Gungsuh", Font.HANGING_BASELINE, 32);
		  System.out.println("Font: "+font);
		  // 가운데 정렬하기 위해, text의 width구하기
		  FontRenderContext frc = new FontRenderContext(null, true, true);
		  Rectangle2D r2 = font.getStringBounds(subject, frc);
		  int textWidth = (int) r2.getWidth();
		  float paddingleft = 0;
		  // 입력하는 문자의 가용 넓이
		  int textWide = 122;
		  paddingleft = ((textWide - textWidth) / 2)-3;
		  print("textWidth : " + textWidth);
		  print("paddingleft : " + paddingleft);
		  // 폰트 색상 설정
		  //g2.setColor(Color.black);
		  g2.setColor(Color.white);
		  // 폰트 종류 설정
		  g2.setFont(font);
		  // 이미지에 텍스트 사입. (text,x축,y축)
		  /*g2.drawString(subject, paddingleft, (float) (imgHeight * 0.8247));*/
		 
		  g2.drawString(subject, paddingleft, 61+12); //이미지 높이의 반 + 글자 크기의 반
		  g2.dispose();
		  try {
			  ImageIO.write(bi, "png", makeImage);
		  } catch (IOException e) {
			  System.out.print("새로운 이미지 저장하다가 에러 나쓔..ㅜㅜ");
			  e.printStackTrace();
		  }
		  print("text length : " + subject.length());
		  print("end make image");
		  long endTime = System.currentTimeMillis();
		  print("currentTimeMillis()형태\n시작시간 : " + startTime + ", 종료시간 : " + endTime);
		  print("이미지 생성하는데 걸린 시간 [" + ((endTime - startTime) / 1000.0) + "]");
	 }
	 public static void print(String str) {
		 System.out.print("\n" + str + "\n");
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
	 
	/* jsl */
	@Override
	public int countBuildService(Map hm) {
		return dao.countBuild(hm);
	}
	
	 
	 @Override
	 public List<BuildDTO>clusterListService(Map map){
		 return dao.clusterList(map);
	 }
	 
	 @Override
	 public void InsertAddInfoService(HashMap addInfo) {
		 dao.InsertAddInfo(addInfo);
	 }

	@Override
	public int myMaxService() {
		return dao.myMax();
	}

	@Override
	public void memHotUpdateService(int buildNo) {
		dao.memHotUpdate(buildNo);
	}

	@Override
	public int memHotSelectService(int buildNo) {
		return dao.memHotSelect(buildNo);
	}

	@Override
	public void memHotDeleteService(int buildNo) {
		dao.memHotDelete(buildNo);
		
	}

	@Override
	public String myHotService() {
		return dao.myHot();
	}

	@Override
	public BuildDTO hotListService(int parseInt) {
		return dao.hotList(parseInt);
		
	}

	@Override
	public String myRecentService() {
		return dao.myRecent();
	}

	@Override
	public BuildDTO recentListService(int parseInt) {
		// TODO Auto-generated method stub
		return dao.recentList(parseInt);
	}

	@Override
	public int memRecentSelectService(String buildNo) {
		return dao.memRecentSelect(buildNo);
	}

	@Override
	public void memRecentUpdateService(String reRecent) {
		dao.memRecentUpdate(reRecent);	
	}

	@Override
	public List<BuildDTO> hotListServicePaging(Map<String, Object> jsonLatLng) {
		return dao.hotListPaging(jsonLatLng);
	}

	@Override
	public List<BuildDTO> selectDeleteListService(Map hm) {
		return dao.selectDeleteList(hm);
	}

	@Override
	public void deleteAddinfoService(BuildDTO buildDTO) {
		dao.deleteAddinfo(buildDTO);
	}

	@Override
	public void deletePriceService(BuildDTO buildDTO) {
		dao.deletePrice(buildDTO);
	}

	@Override
	public void deleteRequestService(BuildDTO buildDTO) {
		dao.deleteRequest(buildDTO);
	}

	@Override
	public void deleteReservationService(BuildDTO buildDTO) {
		dao.deleteReservation(buildDTO);
	}

	@Override
	public void deleteBuildingService(Map hm) {
		dao.deleteBuilding(hm);
	}

	@Override
	public void deleteStaffService(Map hm) {
		dao.deleteStaff(hm);
	}

	@Override
	public List<BuildDTO> selectBuildRequestService(int estate_no) {
		return dao.selectBuildRequest(estate_no);
	}

	@Override
	public Map<String, Object> selectRequestService(Map rMap) {
		return dao.selectRequest(rMap);
	}

	@Override
	public void deleteRequestDoneCallService(int request_no) {
		dao.deleteRequestDoneCall(request_no);
	}
	
	public List<PriceDTO> priceSelectService(BuildDTO dto) {
		return dao.priceSelect(dto);
	}

	
	/* admin 그래프 */
		/* 매물현황 */
	@Override
	public int selectBuildPieService(Map<String, Object> buildPieMap) {
		return dao.selectBuildPie(buildPieMap);
	}

	@Override
	public int selectBuildBarService(Map<String, Object> buildBarMap) {
		return dao.selectBuildBar(buildBarMap);
	}

	@Override
	public int selectBuildLineService(Map<String, Object> buildLineMap) {
		return dao.selectBuildLine(buildLineMap);
	}

		/* 매출현황 */
	@Override
	public int selectBuildBarYearService(Map<String, Object> buildBarYearMap) {
		return dao.selectBuildBarYear(buildBarYearMap);
	}

	@Override
	public int selectBuildBarMonthService(Map<String, Object> buildBarMonthMap) {
		return dao.selectBuildBarMonth(buildBarMonthMap);
	}

	@Override
	public int selectBuildLineYearService(Map<String, Object> buildLineYearMap) {
		return dao.selectBuildLineYear(buildLineYearMap);
	}

	@Override
	public int selectBuildLineDayService(Map<String, Object> buildLineDayMap) {
		return dao.selectBuildLineDay(buildLineDayMap);
	}
	@Override
	public List<BuildDTO> selectBuildAllService(Map<String, Object> hm) {
		return dao.selectBuildAll(hm);
	}

	@Override
	public int countBuildAllService() {
		return dao.countBuildAll();
	}

}
