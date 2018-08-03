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
import com.team.station4.uploadroom.model.CostOptionDTO;
import com.team.station4.uploadroom.model.ExplainDTO;
import com.team.station4.uploadroom.model.MonthlyDTO;
import com.team.station4.uploadroom.model.OptionsDTO;
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
	
//	@RequestMapping(value="house/uploadpic.do")
//	public @ResponseBody List<File> getPic(){
////		List<File> fileList = new ArrayList<File>();
//		System.out.println("hi");
//		return fileList;
//	}
	
	@RequestMapping(value="house/uploaddroomsubmit.do", method=RequestMethod.POST) // @RequestParam(value="photo", required=false) List<MultipartFile> loadfile,
	public String uploadroomsubmit(OptionsDTO optionsDTO, CostOptionDTO costOptionDTO //BuildDTO mapDTO, AddInfoDTO addInfoDTO, ExplainDTO explainDTO, OptionsDTO optionsDTO, PriceDTO priceDTO,
													// @RequestParam(value="monthly", required=false) List<String> monthly, @RequestParam(value="deposit", required=false) List<String> deposit
			) {
		int idx = wholePath.lastIndexOf(",");
		wholePath = wholePath.substring(0, idx);
		System.out.println("getAircon: "+ optionsDTO.getAircon());
		System.out.println("getBed: "+ optionsDTO.getBed());
		System.out.println("getFridge: "+ optionsDTO.getFridge());
		System.out.println("getMicrowave: "+ optionsDTO.getMicrowave());
		System.out.println("getMicrowave: "+ optionsDTO.getShoerack());
		System.out.println("getBidet: "+ optionsDTO.getBidet());
		urService.optionsInsertService(optionsDTO);
		System.out.println("options_no: "+urService.optionsSelectService());
//		System.out.println("addr: "+ mapDTO.getAddress()); // 파일업로드 테스트를 위한 주석 
//		System.out.println("protype: "+ mapDTO.getProtype());
//		System.out.println("wholeFloor: "+ mapDTO.getWholeFloor());
//		System.out.println("getLat: "+ mapDTO.getLat());
//		System.out.println("getLng: "+ mapDTO.getLng());
//		System.out.println("floor: "+ mapDTO.getFloor());
//		System.out.println("gArea: "+ mapDTO.getgArea());
//		System.out.println("jArea: "+ mapDTO.getjArea());
//		System.out.println("CostFee: "+ addInfoDTO.getCostFee());
		System.out.println("getInternet: "+ costOptionDTO.getInternet());
		System.out.println("getCost_tv: "+ costOptionDTO.getCost_tv());
		System.out.println("getCleanFee: "+ costOptionDTO.getCleanFee());
		System.out.println("getWaterFee: "+ costOptionDTO.getWaterFee());
		System.out.println("getGas: "+ costOptionDTO.getGas());
		System.out.println("getElecticity: "+ costOptionDTO.getElecticity());
//		System.out.println("moveDate: "+ addInfoDTO.getMoveDate());
//		System.out.println("getParking: "+ addInfoDTO.getParking());
//		System.out.println("Elevator: "+ addInfoDTO.getElevator());
//		System.out.println("Heat: "+ addInfoDTO.getHeat());
//		System.out.println("animal: "+ addInfoDTO.getAnimal());
//		System.out.println("RoomTitle: "+ explainDTO.getRoomTitle());
//		System.out.println("ExplainText: "+ explainDTO.getExplainText());
//		System.out.println("getPrivateMemo: "+ explainDTO.getPrivateMemo());
//		System.out.println("SalePrice: "+ priceDTO.getSalePrice());
//		System.out.println("Lease: "+ priceDTO.getLease());
//		for(int i=0; i<monthly.size(); i++) {
//			System.out.println("Monthly("+i+"): "+ monthly.get(i));
//			System.out.println("Deposit("+i+"): "+ deposit.get(i));	
//		}
		
		return "redirect:/house/uploadroom.do";
	}

//    private static final int RESULT_EXCEED_SIZE = -2;
//    private static final int RESULT_SUCCESS = 1;
//    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
    
	@ResponseBody
    @RequestMapping(value="house/imageupload.do", method=RequestMethod.POST)
    public int multiImageUpload(@RequestParam("uploadFiles")List<MultipartFile> images) {
		try {
	        long sizeSum = 0;
	        String path = "/Users/harris/Documents/java_bit/sts/workspace/Fullhouse/src/main/webapp/resources/kanu/roomimg";
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
	//            sizeSum += image.getSize();
	//            if(sizeSum >= LIMIT_SIZE) {
	//                return RESULT_EXCEED_SIZE;
	//            }
	
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
