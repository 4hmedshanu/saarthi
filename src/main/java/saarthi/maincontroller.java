package saarthi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.searchform;
import entity.userdata;

@Controller
public class maincontroller {
	
	@Autowired
	private databasework datasql;
	
	@RequestMapping("/")
	public String gethome() {
		return "index";
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
	public String getUtcbus() {
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
		
		List<searchform> data=datasql.getroute(destination);
		mo.addAttribute("destination",destination);
		mo.addAttribute("data",data);
		System.out.println(data);
		return "searchresult";
	}
	
	@RequestMapping("/search")
	
	public String searchutc() {
		
		
		return "redirect:Utc";
	}
	
	
}
