package saarthi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class maincontroller {
	
	@RequestMapping("/")
	public String gethome() {
		return "index";
	}
	
	@RequestMapping("/login")
	public String getlogin() {
		return "loginpage";
	}
	
	@RequestMapping("/sign_up")
	public String getsign_up() {
		return "singup";
	}
}
