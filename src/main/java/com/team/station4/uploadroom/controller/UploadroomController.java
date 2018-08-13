package com.team.station4.uploadroom.controller;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.station4.HomeController;
import com.team.station4.map.model.BuildDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.PriceDTO;
import com.team.station4.uploadroom.model.service.UploadroomService;

@Controller
public class UploadroomController {
	@Autowired
	private UploadroomService urService;
	ArrayList<MultipartFile> imgFiles = new ArrayList<MultipartFile>();
	String wholePath="";
	@RequestMapping(value="house/uploadroom.do", method=RequestMethod.GET)
	public String uploadroom() {
		return "house/uploadroom";
	}
	
	@RequestMapping(value="house/uploaddroomsubmit.do", method=RequestMethod.POST)
	public String uploadroomsubmit(AddInfoDTO addInfoDTO, BuildDTO buildDTO, PriceDTO priceDTO,
													@RequestParam(value="monthly", required=false) List<String> monthly, @RequestParam(value="deposit", required=false) List<String> deposit
			) {
		System.out.println("buildType: "+ buildDTO.getBuildType());
		 // 맨 마지막 ,(콤마) 제거
		if(wholePath.contains(",")) { // 한장일 때, 
			int idx = wholePath.lastIndexOf(",");
			wholePath = wholePath.substring(0, idx);
		}
		System.out.println("wholePath: "+wholePath);
		
		
		urService.addInfoInsertService(addInfoDTO); // 추가정보 
		System.out.println("addinfo_no: "+ urService.addInfoSelectService());
		
		
		//buildDTO.setAddInfo_no(urService.addInfoSelectService());
		buildDTO.setPicPath(wholePath);
		urService.buildingInsertService(buildDTO); // 매물
		System.out.println("buildingSelectService: "+urService.buildingSelectService());
		
		priceDTO.setBuild_no(urService.buildingSelectService());
		for(int i=0; i<monthly.size(); i++) {
			priceDTO.setMonthly(Integer.parseInt(monthly.get(i)));
			priceDTO.setDeposit(Integer.parseInt(deposit.get(i)));
			if(i==0) urService.priceInsertService(priceDTO);
			else urService.priceMonthlyInsertService(priceDTO);
		}
		
		return "redirect:/house/uploadroom.do";
	}

    private static final int RESULT_EXCEED_SIZE = -2;
//    private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
//    private static final long LIMIT_SIZE = 1024 * 1024; // 테스트를 위해 1MB로 해놨따. 
    
	@ResponseBody
    @RequestMapping(value="house/imageupload.do", method=RequestMethod.POST)
    public int multiImageUpload(@RequestParam("uploadFiles")List<MultipartFile> images) {
		try {
			wholePath="";
	        long sizeSum = 0;
	        String path = "resources/kanu/roomimg";
	        File fStore = new File(path);
	        if(!fStore.exists()) {
	        	fStore.mkdirs();
	        	System.out.println("폴더 생성 성공");
	        }
	        for(MultipartFile image : images) {
	        	imgFiles.add(image);
	            String originalName = image.getOriginalFilename();
	            System.out.println("originalname: " + originalName);
	            
	            //용량 검사
	            sizeSum += image.getSize();
	            if(sizeSum >= LIMIT_SIZE) {
	                return RESULT_EXCEED_SIZE;
	            }
	
	            if(new File(path, originalName).exists()) {
	            	int idx = originalName.lastIndexOf(".");
	            	String fileName = originalName.substring(0,  idx);
	            	String fileExt = originalName.substring(idx+1);
	            	
	            	originalName = fileName+"_fhs_"+System.currentTimeMillis()+"."+fileExt; // 사진이름 중복을 방지. _fhs_는 db에서 가져올 때, 뒤의 시간은 날리기 위해 넣어놨다. 
	            }
            	image.transferTo(new File(path, originalName));
//            	System.out.println(path+"/"+originalName+", ");
            	wholePath += path+"/"+originalName+", ";
            	System.out.println(wholePath);
            	System.out.println("파일 저장 성공 !");
	        }
	        //실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
	        //특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
	        return 1;
        }catch(IOException ie) {
        	return -1;
        }
    }
    
}
