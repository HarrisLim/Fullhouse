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

import com.team.station4.estate.model.EstateDTO;
import com.team.station4.main.model.MainDTO;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.map.model.dao.MapDAO;
import com.team.station4.map.vo.PagingVo;
import com.team.station4.room.model.RequestDTO;
import com.team.station4.staff.model.StaffDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
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
	public void memHotUpdateService(HashMap<String, Object> hm) {
		dao.memHotUpdate(hm);
	}

	@Override
	public int memHotSelectService(HashMap<String, Object> hm) {
		return dao.memHotSelect(hm);
	}

	@Override
	public void memHotDeleteService(HashMap<String, Object> hm) {
		dao.memHotDelete(hm);
		
	}

	@Override
	public String myHotService(String email) {
		return dao.myHot(email);
	}

	@Override
	public BuildDTO hotListService(int parseInt) {
		return dao.hotList(parseInt);
		
	}

	@Override
	public String myRecentService(String email) {
		return dao.myRecent(email);
	}

	@Override
	public BuildDTO recentListService(int parseInt) {
		// TODO Auto-generated method stub
		return dao.recentList(parseInt);
	}

	@Override
	public int memRecentSelectService(HashMap<String, Object> hm) {
		return dao.memRecentSelect(hm);
	}

	@Override
	public void memRecentUpdateService(HashMap<String, Object> hm) {
		dao.memRecentUpdate(hm);	
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


}
