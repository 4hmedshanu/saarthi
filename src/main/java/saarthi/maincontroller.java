package saarthi;



import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import entity.District;
import entity.Location;
import entity.live;
import entity.searchform;
import entity.stopage;
import entity.time;
import entity.userdata;


@Controller
public class maincontroller {
	
	@Autowired
	private databasework datasql;
	
	@RequestMapping("/")
	  
	    public String loadHomePage() {
	        return "index"; // Load index.jsp on GET
	    }
	
	
	@RequestMapping("/login")
	public String getlogin() {
		return "loginpage";
	}
	
	@RequestMapping("/login_submit")
	@ResponseBody
	public String setlogin(
			@ModelAttribute userdata user
			) {
		userdata us=datasql.getlogind(user);
		if(us.getFull_name().equals(null)) {
			return ""+0;
		}
		
		return ""+1;
		
	}
	
	@RequestMapping("/sign_up")
	public String getsign_up() {
		return "singup";
	}
	
	@RequestMapping("/sign")
	@ResponseBody
	public String setsign_up(
			@ModelAttribute userdata us
			
			) {
		int val=datasql.singupd(us);
		return ""+val;
	}
	
	
	@RequestMapping("/Utc")
	public String getUtcbus(
			@ModelAttribute searchform search,
			Model mo,
			District de
			) {
		
		System.out.println(datasql.get_district());
		
		List<searchform> se=datasql.getuturoute(search);
		mo.addAttribute("data",se);
		return "utcbus";
	}
	@RequestMapping("/electric")
	public String getelectricbus() {
		return "electricbus";
	}
	
	@RequestMapping("/home")
	public String sethome() {
		return "redirect:/";
	}
	
	@RequestMapping("/mytrickets")
	public String getmytrickets() {
		return "tickets";
	}
	
	@RequestMapping("/find")
	public String getfindmybuss() {
		return "Find_My_Bus";
	}
	
	
	@RequestMapping("/Find")
	public String find(
		
			@ModelAttribute searchform destination,
			Model mo
			) {
		mo.addAttribute("distination",  destination);
		List<searchform> data=datasql.getroute(destination);
		System.out.println(data);
		mo.addAttribute("data",data);
		
		System.out.println(data);
		return "searchresult";
	}
	
	
	
	@RequestMapping("/route/{rout_distance}/{rout}/{from}/{to}")
	public String routefind(
			
			@PathVariable("rout_distance") String rout,
			@PathVariable("rout") String distance,
			@PathVariable("from") String from,
			@PathVariable("to") String to,
			Model mo
			) {
		
		 String API_KEY = "AIzaSyB0QKKZQE5pZQOvzcL2klfb6i196uWbEK0";
		 
		 String eta = time.getETA(from, to, API_KEY);
		 List<stopage> data=datasql.findestope(rout);
		  
		  mo.addAttribute("data",data);
		  System.out.println(data);
		  mo.addAttribute("bus" , distance);
		  mo.addAttribute("from",from);
		  
	      mo.addAttribute("eta", eta);
		  
		  
		  return "viewlocation";
		  
	}
	
	@RequestMapping("District")
	public String Districtget(
			@ModelAttribute District dis,
			Model mo
			) {
		
		datasql.set_District(dis.getDistrict());
		return "redirect:/Utc";
	}
	
	@RequestMapping("/tracking")
	public String gettracking(
			Model mo
			) {
		int id=datasql.get_id();
		System.out.println(id);
		if(id>0) {
		 List<live> se=datasql.getbus_info(id);
		 mo.addAttribute("listdata", se);
		 System.out.println(se);
		}
		mo.addAttribute("id",id);
		return "Live";
	}
	
	@RequestMapping("/searts")
	public String getseart() {
	
		return "seart";
	}
	
	@RequestMapping("/Detail")
	public String getlive(
			@RequestParam("PNR") int id,
			Model mo
			) {
		datasql.set_id(id);
		return "redirect:/tracking";
	}
	
	@RequestMapping("/Buypay")
	public String getticket_pay() {
		return "trickets";
	}
	
	
  

   
    
    
	
	
	
	

	    
	  
	     
	}

	
	
	

	 
	    
	    
	  
