package com.team.station4.uploadroom.controller;



import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team.station4.HomeController;
import com.team.station4.map.model.MapDTO;
import com.team.station4.uploadroom.model.AddInfoDTO;
import com.team.station4.uploadroom.model.CostOptionDTO;
import com.team.station4.uploadroom.model.ExplainDTO;
import com.team.station4.uploadroom.model.OptionsDTO;

@Controller
public class UploadroomController {
ArrayList<MultipartFile> file = new ArrayList<MultipartFile>();

	@RequestMapping(value="house/uploadroom.do", method=RequestMethod.GET)
	public String uploadroom() {
		return "house/uploadroom";
	}

	@RequestMapping(value="house/uploaddroomsubmit.do", method=RequestMethod.POST)
	public String uploadroomsubmit(@RequestParam(value="photo", required=false) List<MultipartFile> loadfile, MapDTO mapDTO, AddInfoDTO addInfoDTO, 
													CostOptionDTO costOptionDTO, ExplainDTO explainDTO, OptionsDTO optionsDTO) {
		System.out.println("addr: "+ mapDTO.getAddress());
		System.out.println("protype: "+ mapDTO.getProtype());
		System.out.println("wholeFloor: "+ mapDTO.getWholeFloor());
		System.out.println("floor: "+ mapDTO.getFloor());
		System.out.println("gArea: "+ mapDTO.getgArea());
		System.out.println("jArea: "+ mapDTO.getjArea());
		System.out.println("CostFee: "+ addInfoDTO.getCostFee());
		System.out.println("getInternet: "+ costOptionDTO.getInternet());
		System.out.println("getCost_tv: "+ costOptionDTO.getCost_tv());
		System.out.println("getCleanFee: "+ costOptionDTO.getCleanFee());
		System.out.println("getWaterFee: "+ costOptionDTO.getWaterFee());
		System.out.println("getGas: "+ costOptionDTO.getGas());
		System.out.println("getElecticity: "+ costOptionDTO.getElecticity());
		System.out.println("moveDate: "+ addInfoDTO.getMoveDate());
		System.out.println("getParking: "+ addInfoDTO.getParking());
		System.out.println("Elevator: "+ addInfoDTO.getElevator());
		System.out.println("Heat: "+ addInfoDTO.getHeat());
		System.out.println("animal: "+ addInfoDTO.getAnimal());
		System.out.println("getAircon: "+ optionsDTO.getAircon());
		System.out.println("getBed: "+ optionsDTO.getBed());
		System.out.println("getFridge: "+ optionsDTO.getFridge());
		System.out.println("getMicrowave: "+ optionsDTO.getMicrowave());
		System.out.println("getBidet: "+ optionsDTO.getBidet());
		System.out.println("RoomTitle: "+ explainDTO.getRoomTitle());
		System.out.println("ExplainText: "+ explainDTO.getExplainText());
		System.out.println("getPrivateMemo: "+ explainDTO.getPrivateMemo());
		System.out.println("loadfile: "+ loadfile);
		System.out.println("loadfile.size: "+ loadfile.size());
		
		return "redirect:/house/uploadroom.do";
	}
	
	@RequestMapping(value="house/uploadroomajax.do", method=RequestMethod.POST)
	public @ResponseBody String uploadroomajax(@RequestParam(value="photo", required=false) List<MultipartFile> loadfile) {
		System.out.println("(1) hi: "+ loadfile);
		System.out.println("(2) hi.size: "+ loadfile.size());
		for(int i=0; i<loadfile.size(); i++) {
			file.add(loadfile.get(i));
		}
		
		return "house/uploadroom";
	}
}

//@RequestParam(value="photo", required=false) List<MultipartFile> loadfile, @RequestParam(value="addr") String addr,
//@RequestParam(value="detailAddr") String detailAddr, @RequestParam(value="protype") String protype,
//@RequestParam(value="wholeFloor") String wholeFloor, @RequestParam(value="floor") String floor,
//@RequestParam(value="gArea") int gArea, @RequestParam(value="jArea") int jArea
